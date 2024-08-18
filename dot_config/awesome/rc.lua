-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgency = "critical",
		title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
		message = message,
	})
end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "xresources/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/base16.lua")
beautiful.icon_theme = "Papirus-Dark"
-- beautiful.icon_theme = "Qogir-dark"

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
files = "thunar"
browser = "brave"
appearance = "lxappearance"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor
rofi_launcher = os.getenv("HOME") .. "/.config/rofi/launcher.sh"
rofi_launcher_menu = os.getenv("HOME") .. "/.config/rofi/launcher-menu.sh"
rofi_tasks = os.getenv("HOME") .. "/.config/rofi/tasks.sh"
rofi_taskws = os.getenv("HOME") .. "/.config/rofi/taskws.sh"
rofi_powermenu = os.getenv("HOME") .. "/.config/rofi/powermenu.sh"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
altkey = "Mod1"
-- }}}

--- Menu
require("ui.menu")

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		awful.layout.suit.floating,
		awful.layout.suit.tile,
		-- awful.layout.suit.tile.left,
		-- awful.layout.suit.tile.bottom,
		-- awful.layout.suit.tile.top,
		-- awful.layout.suit.fair,
		-- awful.layout.suit.fair.horizontal,
		-- awful.layout.suit.spiral,
		awful.layout.suit.spiral.dwindle,
		awful.layout.suit.max,
		awful.layout.suit.max.fullscreen,
		awful.layout.suit.magnifier,
		-- awful.layout.suit.corner.nw,
	})
end)
-- }}}

-- {{{ Wallpaper
screen.connect_signal("request::wallpaper", function(s)
	awful.wallpaper({
		screen = s,
		widget = {
			{
				image = beautiful.wallpaper,
				upscale = true,
				downscale = true,
				widget = wibox.widget.imagebox,
			},
			valign = "center",
			halign = "center",
			tiled = false,
			widget = wibox.container.tile,
		},
	})
end)
-- }}}

-- Wibar
require("ui.panels.top")
-- require("ui.panel.taskslist")

--- Bindings
require("conf.bindings")

--- Rules
require("conf.rules")

--- Titlebars
require("ui.titlebar.win")

-- {{{ Notifications

ruled.notification.connect_signal("request::rules", function()
	-- All notifications will match this rule.
	ruled.notification.append_rule({
		rule = {},
		properties = {
			screen = awful.screen.preferred,
			implicit_timeout = 5,
		},
	})
end)

naughty.connect_signal("request::display", function(n)
	naughty.layout.box({ notification = n })
end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:activate({ context = "mouse_enter", raise = false })
end)

awful.spawn.with_shell( os.getenv("HOME") .. "/.config/awesome/startup")