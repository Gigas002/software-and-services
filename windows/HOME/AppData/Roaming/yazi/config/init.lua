function Linemode:mtime_full()
    local time = math.floor(self._file.cha.mtime or 0)
    local date = time > 0 and os.date("%H:%M %d.%m.%Y", time) or ""

    local size = self._file:size()
    local size_str = size and ya.readable_size(size) or "-"

    return string.format("%s  %s", size_str, date)
end

-- git.yazi: show git status signs in the file list
require("git"):setup {
    order = 1500,
}
