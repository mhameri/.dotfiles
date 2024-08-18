---------------------------
-- assets awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir().."themes/"
local dir_path = gfs.get_dir()
local conf_dir_path = gfs.get_configuration_dir()
local theme_name = "base16"
local xrdb = xresources.get_current_theme()

local theme = {}

theme.font          = "sans 8"

local base00 = "#1a1b26"
local base01 = "#16161e"
local base02 = "#2f3549"
local base03 = "#444b6a"
local base04 = "#787c99"
local base05 = "#a9b1d6"
local base06 = "#cbccd1"
local base07 = "#d5d6db"
local base08 = "#c0caf5"
local base09 = "#a9b1d6"
local base0A = "#0db9d7"
local base0B = "#9ece6a"
local base0C = "#b4f9f8"
local base0D = "#2ac3de"
local base0E = "#bb9af7"
local base0F = "#f7768e"

local xbackground   = xrdb.xbackground  or base00
local xforeground   = xrdb.xforeground  or base05
local xcolor0       = xrdb.color0       or base00
local xcolor1       = xrdb.color1       or base08
local xcolor2       = xrdb.color2       or base0B
local xcolor3       = xrdb.color3       or base0A
local xcolor4       = xrdb.color4       or base0D
local xcolor5       = xrdb.color5       or base0E
local xcolor6       = xrdb.color6       or base0C
local xcolor7       = xrdb.color7       or base05
local xcolor8       = xrdb.color8       or base03
local xcolor9       = xrdb.color9       or base09
local xcolor10      = xrdb.color10      or base01
local xcolor11      = xrdb.color11      or base02
local xcolor12      = xrdb.color12      or base04
local xcolor13      = xrdb.color13      or base06
local xcolor14      = xrdb.color14      or base0F
local xcolor15      = xrdb.color15      or base07


theme.bg_normal     = xbackground
theme.bg_focus      = xcolor10
theme.bg_urgent     = xcolor14
theme.bg_minimize   = xcolor13
theme.bg_systray    = xcolor10

theme.fg_normal     = xforeground
theme.fg_focus      = xcolor11
theme.fg_urgent     = xcolor11
theme.fg_minimize   = xcolor11

theme.useless_gap         = dpi(0)
theme.border_width        = dpi(1)
theme.border_color_normal = xcolor0
theme.border_color_active = xcolor9
theme.border_color_marked = xcolor14

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."assets/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."assets/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."assets/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."assets/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."assets/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."assets/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."assets/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."assets/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."assets/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."assets/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."assets/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."assets/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."assets/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."assets/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."assets/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."assets/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."assets/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."assets/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."assets/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."assets/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."assets/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."assets/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."assets/layouts/fairhw.png"
theme.layout_fairv = themes_path.."assets/layouts/fairvw.png"
theme.layout_floating  = themes_path.."assets/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."assets/layouts/magnifierw.png"
theme.layout_max = themes_path.."assets/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."assets/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."assets/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."assets/layouts/tileleftw.png"
theme.layout_tile = themes_path.."assets/layouts/tilew.png"
theme.layout_tiletop = themes_path.."assets/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."assets/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."assets/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."assets/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."assets/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."assets/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."assets/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
