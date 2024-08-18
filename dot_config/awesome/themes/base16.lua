---------------------------
-- assets awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local shape = require("gears.shape")
local gfs = require("gears.filesystem")

local configs_path = gfs.get_configuration_dir()
local themes_path = gfs.get_configuration_dir().."themes/"
local dir_path = gfs.get_dir()
local conf_dir_path = gfs.get_configuration_dir()
local theme_name = "base16"
local xrdb = xresources.get_current_theme()
local color = {}
local theme = {}

theme.font          = "MesloLGS Nerd Font Mono 9"
theme.icon_theme    = "Papirus-Dark"

-- base00 - Default Background
-- base01 - Lighter Background (Used for status bars, line number and folding marks)
-- base02 - Selection Background
-- base03 - Comments, Invisibles, Line Highlighting
-- base04 - Dark Foreground (Used for status bars)
-- base05 - Default Foreground, Caret, Delimiters, Operators
-- base06 - Light Foreground (Not often used)
-- base07 - Brightest Foreground (Not often used)
-- base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
-- base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
-- base0A - Classes, Markup Bold, Search Text Background
-- base0B - Strings, Inherited Class, Markup Code, Diff Inserted
-- base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
-- base0D - Functions, Methods, Attribute IDs, Headings
-- base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
-- base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

color.base00 = "#1a1b26"
color.base01 = "#16161e"
color.base02 = "#2f3549"
color.base03 = "#444b6a"
color.base04 = "#787c99"
color.base05 = "#a9b1d6"
color.base06 = "#cbccd1"
color.base07 = "#d5d6db"
color.base08 = "#c0caf5"
color.base09 = "#a9b1d6"
color.base0A = "#0db9d7"
color.base0B = "#9ece6a"
color.base0C = "#b4f9f8"
color.base0D = "#2ac3de"
color.base0E = "#bb9af7"
color.base0F = "#f7768e"


theme.bg_normal     = color.base00
theme.bg_focus      = color.base01
theme.bg_urgent     = color.base0F
theme.bg_minimize   = color.base06
theme.bg_systray    = color.base00

theme.fg_normal     = color.base05
theme.fg_focus      = color.base06
theme.fg_urgent     = color.base0E
theme.fg_minimize   = color.base04

theme.useless_gap         = dpi(5)
theme.border_width        = dpi(1)
theme.border_color_normal = color.base00
theme.border_color_active = color.base09
theme.border_color_marked = color.base0F

-- wibar
-- theme.wibar_stretch = nil
-- theme.wibar_favor_vertical = nil
theme.wibar_border_width = dpi(1)
theme.wibar_border_color = color.base0E
-- theme.wibar_ontop = nil
-- theme.wibar_cursor = nil
theme.wibar_opacity = 0.8
-- theme.wibar_type = nil
-- theme.wibar_width = nil
theme.wibar_height = dpi(30)
-- theme.wibar_bg = nil
-- theme.wibar_bgimage = nil
-- theme.wibar_fg = nil
-- theme.wibar_shape = nil
theme.wibar_margins = dpi(5)
-- theme.wibar_align = nil

-- tasklist
-- theme.tasklist_fg_normal = nil
-- theme.tasklist_bg_normal = nil
-- theme.tasklist_fg_focus = nil
-- theme.tasklist_bg_focus = nil
-- theme.tasklist_fg_urgent = nil
-- theme.tasklist_bg_urgent = nil
-- theme.tasklist_fg_minimize = nil
-- theme.tasklist_bg_minimize = nil
-- theme.tasklist_bg_image_normal = nil
-- theme.tasklist_bg_image_focus = nil
-- theme.tasklist_bg_image_urgent = nil
-- theme.tasklist_bg_image_minimize = nil
-- theme.tasklist_disable_icon = nil
-- theme.tasklist_disable_task_name = nil
-- theme.tasklist_plain_task_name = nil
-- theme.tasklist_sticky = nil
-- theme.tasklist_ontop = nil
-- theme.tasklist_above = nil
-- theme.tasklist_below = nil
-- theme.tasklist_floating = nil
-- theme.tasklist_maximized = nil
-- theme.tasklist_maximized_horizontal = nil
-- theme.tasklist_maximized_vertical = nil
-- theme.tasklist_minimized = nil
-- theme.tasklist_align = nil
-- theme.tasklist_font = nil
-- theme.tasklist_font_focus = nil
-- theme.tasklist_font_minimized = nil
-- theme.tasklist_font_urgent = nil
-- theme.tasklist_spacing = nil
-- theme.tasklist_shape = nil
-- theme.tasklist_shape_border_width = nil
-- theme.tasklist_shape_border_color = nil
-- theme.tasklist_shape_focus = nil
-- theme.tasklist_shape_border_width_focus = nil
-- theme.tasklist_shape_border_color_focus = nil
-- theme.tasklist_shape_minimized = nil
-- theme.tasklist_shape_border_width_minimized = nil
-- theme.tasklist_shape_border_color_minimized = nil
-- theme.tasklist_shape_urgent = nil
-- theme.tasklist_shape_border_width_urgent = nil
-- theme.tasklist_shape_border_color_urgent = nil
-- theme.tasklist_icon_size=dpi(20)

-- systray
theme.systray_max_rows = 1
theme.systray_icon_spacing = dpi(1)


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


local ntf_shape = function(cr, width, height)
    shape.partially_rounded_rect(cr, width, height, true, false, true, true, 18)
end
local tagshape = function(cr, width, height)
    shape.shape.partial_squircle(cr, 20, 20, true, false, true)
end
-- taglist
-- theme.taglist_fg_focus = nil
-- theme.taglist_bg_focus = nil
-- theme.taglist_fg_urgent = nil
-- theme.taglist_bg_urgent = nil
-- theme.taglist_bg_occupied = nil
theme.taglist_fg_occupied = color.base0D
-- theme.taglist_bg_empty = color.base06
theme.taglist_fg_empty = color.base04
-- theme.taglist_bg_volatile = nil
-- theme.taglist_fg_volatile = nil
-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--     taglist_square_size, theme.fg_normal
-- )
-- theme.taglist_squares_sel_empty = nil
-- theme.taglist_squares_unsel_empty = nil
-- theme.taglist_squares_resize = nil
-- theme.taglist_disable_icon = nil
-- theme.taglist_font = nil
-- theme.taglist_spacing = nil
-- theme.taglist_shape = tagshape
-- theme.taglist_shape_border_width = 1
-- theme.taglist_shape_border_color = color.base04
-- theme.taglist_shape_empty = tagshape
-- theme.taglist_shape_border_width_empty = nil
-- theme.taglist_shape_border_color_empty = nil
-- theme.taglist_shape_focus = nil
-- theme.taglist_shape_border_width_focus = nil
-- theme.taglist_shape_border_color_focus = nil
-- theme.taglist_shape_urgent = nil
-- theme.taglist_shape_border_width_urgent = nil
-- theme.taglist_shape_border_color_urgent = nil
-- theme.taglist_shape_volatile = nil
-- theme.taglist_shape_border_width_volatile = nil
-- theme.taglist_shape_border_color_volatile = nil

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = configs_path.."assets/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(120)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = configs_path.."assets/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = configs_path.."assets/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = configs_path.."assets/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = configs_path.."assets/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = configs_path.."assets/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = configs_path.."assets/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = configs_path.."assets/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = configs_path.."assets/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = configs_path.."assets/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = configs_path.."assets/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = configs_path.."assets/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = configs_path.."assets/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = configs_path.."assets/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = configs_path.."assets/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = configs_path.."assets/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = configs_path.."assets/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = configs_path.."assets/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = configs_path.."assets/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = configs_path.."assets/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = configs_path.."assets/titlebar/maximized_focus_active.png"

theme.wallpaper = configs_path.."assets/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = configs_path.."assets/layouts/fairhw.png"
theme.layout_fairv = configs_path.."assets/layouts/fairvw.png"
theme.layout_floating  = configs_path.."assets/layouts/floatingw.png"
theme.layout_magnifier = configs_path.."assets/layouts/magnifierw.png"
theme.layout_max = configs_path.."assets/layouts/maxw.png"
theme.layout_fullscreen = configs_path.."assets/layouts/fullscreenw.png"
theme.layout_tilebottom = configs_path.."assets/layouts/tilebottomw.png"
theme.layout_tileleft   = configs_path.."assets/layouts/tileleftw.png"
theme.layout_tile = configs_path.."assets/layouts/tilew.png"
theme.layout_tiletop = configs_path.."assets/layouts/tiletopw.png"
theme.layout_spiral  = configs_path.."assets/layouts/spiralw.png"
theme.layout_dwindle = configs_path.."assets/layouts/dwindlew.png"
theme.layout_cornernw = configs_path.."assets/layouts/cornernww.png"
theme.layout_cornerne = configs_path.."assets/layouts/cornernew.png"
theme.layout_cornersw = configs_path.."assets/layouts/cornersww.png"
theme.layout_cornerse = configs_path.."assets/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, color.base03, color.base09
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different color for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
