#!/usr/bin/env nu

def main [
  dir: path = "."
  --threads (-t): int = 4
] {

  let image_exts = [
    "png" "jpg" "jpeg" "webp" "avif" "gif" "bmp" "tiff" "tif"
  ]

  glob ($dir | path join "**/*")
  | where { ($in | path type) == file }
  | where {
      let p = ($in | path parse)
      let ext = ($p.extension | default "" | str downcase)
      $ext in $image_exts
    }
  | where {
      let p = ($in | path parse)
      not (($p.parent | path join ($p.stem + ".jxl")) | path exists)
    }
    | par-each --threads $threads { |path|

        let p = ($path | path parse)
        let out = ($p.parent | path join ($p.stem + ".jxl"))
        let ext = ($p.extension | default "" | str downcase)

        let r = if $ext == "webp" {
            dwebp $path -o -
            | ^cjxl - $out
            | complete
        } else {
            ^cjxl $path $out | complete
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
