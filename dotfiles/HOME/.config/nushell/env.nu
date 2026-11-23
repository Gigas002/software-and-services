$env.MICRO_TRUECOLOR = "1"

match $nu.os-info.name {
    "linux" => {
        $env.EDITOR = "helix"
        $env.VISUAL = "zeditor"
        $env.DIFFPROG = "zeditor --wait --diff"
    }
    "macos" => {
        $env.EDITOR = "hx"
        $env.VISUAL = "zed"
        # brew's binaries, and flutter/dart pub installs via fvm (for LSPs too)
        $env.PATH = ($env.PATH | prepend "/opt/homebrew/bin")
        $env.PATH = ($env.PATH | append ($nu.home-dir | path join "fvm/default/bin"))
        $env.PATH = ($env.PATH | append ($nu.home-dir | path join ".pub-cache/bin"))
    }
    "windows" => {
        $env.EDITOR = "hx"
        $env.VISUAL = "zed"
    }
}
