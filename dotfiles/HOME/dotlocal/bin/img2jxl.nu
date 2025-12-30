#!/usr/bin/env nu

def main [
  dir: path = "."
  --threads (-t): int = 4
] {

  let image_exts = [
    "png" "jpg" "jpeg" "webp" "avif" "gif"
    "bmp" "tiff" "tif"
    "heic" "heif"
  ]

  let pattern = ($dir | path join "**/*")

  # IMPORTANT: bind pipeline inside def
  let files = (
    glob $pattern
    | where { ($in | path type) == "file" }
    | where {
        let p = ($in | path parse)
        let ext = ($p.extension | default "" | str downcase)
        $ext in $image_exts
      }
    | where {
        let p = ($in | path parse)
        not (($p.parent | path join ($p.stem + ".jxl")) | path exists)
      }
  )

  $files
  | par-each --threads $threads { |path|

      let p = ($path | path parse)
      let out = ($p.parent | path join ($p.stem + ".jxl"))
      let ext = ($p.extension | default "" | str downcase)

      let r = match $ext {

        # ---------- WEBP ----------
        "webp" => {
          dwebp $path -o - | ^cjxl - $out | complete
        }

        # ---------- AVIF ----------
        "avif" => {
          let tmp = ($p.parent | path join ($p.stem + ".tmp.png"))
          let _ = (avifdec $path $tmp | complete)
          let r = (^cjxl $tmp $out | complete)
          rm --force $tmp
          $r
        }

        # ---------- HEIC / HEIF ----------
        "heic" | "heif" => {
          let tmp = ($p.parent | path join ($p.stem + ".heic.png"))

          let r = if (which magick | is-not-empty) {
            magick $path -auto-orient $tmp | complete
          } else if (which heif-convert | is-not-empty) {
            heif-convert $path $tmp | complete
          } else {
            { exit_code: 1 }
          }

          if $r.exit_code == 0 {
            let r2 = (^cjxl $tmp $out | complete)
            rm --force $tmp
            $r2
          } else {
            $r
          }
        }

        # ---------- JPEG ----------
        "jpg" | "jpeg" => {
          let r = (^cjxl $path $out | complete)

          if $r.exit_code != 0 {

            if (which magick | is-not-empty) {
              let tmp = ($p.parent | path join ($p.stem + ".rgb.jpg"))
              let _ = (magick $path -colorspace RGB $tmp | complete)
              let r2 = (^cjxl $tmp $out | complete)
              rm --force $tmp

              if $r2.exit_code != 0 {
                let tmp2 = ($p.parent | path join ($p.stem + ".reencoded.jpg"))
                let _ = (magick $path $tmp2 | complete)
                let r3 = (^cjxl $tmp2 $out | complete)
                rm --force $tmp2
                $r3
              } else {
                $r2
              }
            } else {
              $r
            }

          } else {
            $r
          }
        }

        # ---------- PNG ----------
        "png" => {
          let r = (^cjxl $path $out | complete)

          if $r.exit_code != 0 and (which magick | is-not-empty) {

            let tmp = ($p.parent | path join ($p.stem + ".fixed.png"))

            # Strip metadata + force RGBA
            let _ = (
              magick $path
                -strip
                -define png:color-type=6
                PNG32:$tmp
              | complete
            )

            let r2 = (^cjxl $tmp $out | complete)
            rm --force $tmp
            $r2

          } else {
            $r
          }
        }

        # ---------- OTHER ----------
        _ => {
          ^cjxl $path $out | complete
        }
      }

      if $r.exit_code == 0 and ($out | path exists) {
        rm --force $path
        print $"(ansi green)✔ ($path)(ansi reset)"
      } else {
        print $"(ansi red)✘ FAILED: ($path)(ansi reset)"
      }
    }

  print $"(ansi cyan)Done.(ansi reset)"
}
