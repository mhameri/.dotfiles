local beautiful = require("beautiful")
local awful = require("awful")
local menubar = require("menubar")

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "Manual", terminal .. " -e man awesome" },
	{ "Edit", editor_cmd .. " " .. awesome.conffile },
	{ "Reload", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

mypowermenu = {
    { "Log out", function() awesome.quit() end, menubar.utils.lookup_icon("system-log-out") },
    { "Suspend", "systemctl suspend", menubar.utils.lookup_icon("system-suspend") },
    { "Hibernate", "systemctl hibernate", menubar.utils.lookup_icon("system-suspend-hibernate") },
    { "Reboot", "systemctl reboot", menubar.utils.lookup_icon("system-reboot") },
    { "Shutdown", "poweroff", menubar.utils.lookup_icon("system-shutdown") }
}

mymainmenu = awful.menu({
	items = {
		{ "Awesome", myawesomemenu, beautiful.awesome_icon },
		{ "Powermenu", mypowermenu, menubar.utils.lookup_icon("system-shutdown")  },
		{ "Terminal", terminal , menubar.utils.lookup_icon("terminal")},
		{ "File Manager", files, menubar.utils.lookup_icon("Thunar") },
		{ "Web Browser", browser, menubar.utils.lookup_icon("brave") },
		{ "Apperance", appearance, menubar.utils.lookup_icon("gtk-theme-config") },
	},
})

-- mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
