-- https://github.com/ipetepete/beastmode_theme/blob/master/config/awesome/rc.lua
local xresources = require("beautiful.xresources")
local xrdb = xresources.get_current_theme()
local dpi = xresources.apply_dpi

-- Get colors from .Xresources and set fallback colors
beautiful.xbackground = xrdb.background or "#333333"
beautiful.xforeground = xrdb.foreground or "#F1FCF9"
beautiful.xcolor0     = xrdb.color0     or "#20262C"
beautiful.xcolor1     = xrdb.color1     or "#DB86BA"
beautiful.xcolor2     = xrdb.color2     or "#74DD91"
beautiful.xcolor3     = xrdb.color3     or "#E49186"
beautiful.xcolor4     = xrdb.color4     or "#75DBE1"
beautiful.xcolor5     = xrdb.color5     or "#B4A1DB"
beautiful.xcolor6     = xrdb.color6     or "#9EE9EA"
beautiful.xcolor7     = xrdb.color7     or "#F1FCF9"
beautiful.xcolor8     = xrdb.color8     or "#465463"
beautiful.xcolor9     = xrdb.color9     or "#D04E9D"
beautiful.xcolor10    = xrdb.color10    or "#4BC66D"
beautiful.xcolor11    = xrdb.color11    or "#DB695B"
beautiful.xcolor12    = xrdb.color12    or "#3DBAC2"
beautiful.xcolor13    = xrdb.color13    or "#825ECE"
beautiful.xcolor14    = xrdb.color14    or "#62CDCD"
beautiful.xcolor15    = xrdb.color15    or "#E0E5E5"

theme.useless_gap   = awesome.xrdb_get_value("", "uselessGap")      or  dpi(20)
theme.border_width  = awesome.xrdb_get_value("", "borderWidth")     or  dpi(20)

-- This is how to get other .Xresources values (beyond colors 0-15, or custom variables)
-- local cool_color = awesome.xrdb_get_value("", "color16")


beautiful.bg_dark       = beautiful.color8
beautiful.bg_normal     = beautiful.xbackground
beautiful.bg_focus      = "#333333" --beautiful.xcolor1
beautiful.bg_urgent     = beautiful.xcolor9
beautiful.bg_minimize   = beautiful.xcolor15
beautiful.bg_systray    = beautiful.xbackground

beautiful.fg_normal     = beautiful.xforeground
beautiful.fg_focus      = beautiful.xforeground
beautiful.fg_urgent     = beautiful.xcolor12
beautiful.fg_minimize   = beautiful.xforeground

beautiful.medium_dark   = beautiful.xcolor8
beautiful.selected      = beautiful.xcolor9

-- Borders
beautiful.border_width  = dpi(0)
beautiful.border_color = beautiful.xcolor8
beautiful.border_normal = beautiful.xcolor8
beautiful.border_focus  = beautiful.xcolor8
-- Rounded corners
beautiful.border_radius = dpi(10)
-- Gaps
beautiful.useless_gap   = dpi(12)
beautiful.border_width  = dpi(0)
beautiful.screen_margin = dpi(12)
-- Sidebar
beautiful.sidebar_bg = theme.xcolor13
beautiful.sidebar_fg = theme.xbackground