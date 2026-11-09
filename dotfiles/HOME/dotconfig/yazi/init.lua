function Linemode:mtime_full()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		return ""
	end
	return os.date("%H:%M %d.%m.%Y", time)
end

-- git.yazi: show git status signs in the file list
require("git"):setup {
	order = 1500,
}
