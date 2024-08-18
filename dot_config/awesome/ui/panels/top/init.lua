local beautiful = require("beautiful")
local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")


-- local tag_names = {"󰃚", "󰝥", "󰝥", "󰝥", "󰝥", "󰝥", "󰝥", "󰝥"}

local tag_names = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
local tag_colors={
	"#a9b1d6",
	"#cbccd1",
	"#d5d6db",
	"#c0caf5",
	"#a9b1d6",
	"#0db9d7",
	"#9ece6a",
	"#b4f9f8",
	"#2ac3de",
	"#bb9af7",
	"#f7768e",
}
-- {{{ Wibar

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- creae Systray
local mysystray = wibox.widget.systray()
mysystray:set_base_size(20)
mysystray = wibox.container.margin(mysystray,0,0,5,5)

-- Create a textclock widget
-- local mytextclock = wibox.widget.textclock()
local mytextclock = wibox.widget.textclock("  %e/%I/%Y  %l:%M %p ", 1)

local mynetspeed = require("ui.widgets.net-speed")

local cpu_widget = require("ui.widgets.cpu")

-- docker_widget = require("ui.widgets.docker")

-- local fs_widget = require("ui.widgets.fs-widget")

local ram_widget = require("ui.widgets.ram-widget")

-- local volume_widget = require("ui.widgets.pactl-widget")
-- local volume_widget = require("ui.widgets.volume-widget")

-- brightness_widget = require("ui.widgets.brightness")

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, command = rofi_launcher_menu })

screen.connect_signal("request::desktop_decoration", function(s)
	-- Each screen has its own tag table.
	awful.tag(tag_names, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox({
		screen = s,
		buttons = {
			awful.button({}, 1, function()
				awful.layout.inc(1)
			end),
			awful.button({}, 3, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 4, function()
				awful.layout.inc(-1)
			end),
			awful.button({}, 5, function()
				awful.layout.inc(1)
			end),
		},
	})

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = {
			awful.button({}, 1, function(t)
				t:view_only()
			end),
			awful.button({ modkey }, 1, function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end),
			awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
				if client.focus then
					client.focus:toggle_tag(t)
				end
			end),
			awful.button({}, 4, function(t)
				awful.tag.viewprev(t.screen)
			end),
			awful.button({}, 5, function(t)
				awful.tag.viewnext(t.screen)
			end),
		},
	})

	-- s.mytaglist = awful.widget.taglist({
	-- 	screen = s,
	-- 	filter = awful.widget.taglist.filter.all,
	-- 	widget_template = {
	-- 		{
	-- 			{
	-- 				{
	-- 					{
	-- 						{
	-- 							id     = "index_role",
	-- 							widget = wibox.widget.textbox,
	-- 						},
	-- 						margins = 4,
	-- 						widget  = wibox.container.margin,
	-- 					},
	-- 					bg     = "#dddddd",
	-- 					shape  = gears.shape.circle,
	-- 					widget = wibox.container.background,
	-- 				},
	-- 				{
	-- 					{
	-- 						id     = "icon_role",
	-- 						widget = wibox.widget.imagebox,
	-- 					},
	-- 					margins = 2,
	-- 					widget  = wibox.container.margin,
	-- 				},
	-- 				layout = wibox.layout.fixed.horizontal,
	-- 			},
	-- 			-- left  = 18,
	-- 			-- right = 18,
	-- 			widget = wibox.container.margin
	-- 		},
	-- 		id     = "background_role",
	-- 		widget = wibox.container.background,
	-- 		-- Add support for hover colors and an index label
	-- 		create_callback = function(self, c3, index, objects) --luacheck: no unused args
	-- 			self:get_children_by_id("index_role")[1].markup = "<b> "..c3.index.." </b>"
	-- 			self:connect_signal("mouse::enter", function()
	-- 				if self.bg ~= "#ff0000" then
	-- 					self.backup     = self.bg
	-- 					self.has_backup = true
	-- 				end
	-- 				self.bg = "#ff0000"
	-- 			end)
	-- 			self:connect_signal("mouse::leave", function()
	-- 				if self.has_backup then self.bg = self.backup end
	-- 			end)
	-- 		end,
	-- 		update_callback = function(self, c3, index, objects) --luacheck: no unused args
	-- 			self:get_children_by_id("index_role")[1].markup = "<b> "..c3.index.." </b>"
	-- 		end,
	-- 	},
	-- 	buttons = {
	-- 		awful.button({}, 1, function(t)
	-- 			t:view_only()
	-- 		end),
	-- 		awful.button({ modkey }, 1, function(t)
	-- 			if client.focus then
	-- 				client.focus:move_to_tag(t)
	-- 			end
	-- 		end),
	-- 		awful.button({}, 3, awful.tag.viewtoggle),
	-- 		awful.button({ modkey }, 3, function(t)
	-- 			if client.focus then
	-- 				client.focus:toggle_tag(t)
	-- 			end
	-- 		end),
	-- 		awful.button({}, 4, function(t)
	-- 			awful.tag.viewprev(t.screen)
	-- 		end),
	-- 		awful.button({}, 5, function(t)
	-- 			awful.tag.viewnext(t.screen)
	-- 		end),
	-- 	},
	-- })

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.allscreen,
		buttons = {
			awful.button({}, 1, function(c)
				c:activate({ context = "tasklist", switch_to_tag = true, action = "toggle_minimization" })
			end),
			awful.button({}, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end),
			awful.button({}, 4, function()
				awful.client.focus.byidx(-1)
			end),
			awful.button({}, 5, function()
				awful.client.focus.byidx(1)
			end),
		},
	})

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		widget = {
			layout = wibox.layout.align.horizontal,
			expand = "none",
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
				halign = "left",
				mylauncher,
				s.mytaglist,
				wibox.container.margin(s.mylayoutbox,5,5,5,5),
				s.mypromptbox,
			},
			{ -- Middle widgets
				layout = wibox.layout.fixed.horizontal,
				halign = "center",
				mytextclock,
				-- s.mytasklist, -- Middle widget
	  		},
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
				halign="right",
				-- brightness_widget{
				-- 	type = 'icon_and_text',
				-- 	program = 'xbacklight',
				-- 	step = 2,      
				-- 	percentage = true,  
				-- },
				ram_widget(),
				-- docker_widget{
				-- 	number_of_containers = 5
				-- },
				-- fs_widget({ mounts = { '/', '/mnt/data' , '/mnt/windows' , '/mnt/nfsData', } }), -- multiple mounts
				cpu_widget({
					width = 50,
					step_width = 2,
					step_spacing = 0,
					enable_kill_button = true
				}),
				mynetspeed({
					width = 60,
				}),
				-- volume_widget{
				-- 	widget_type = 'icon'
				-- },
				mysystray,
				mykeyboardlayout,
			},
		},
	})
end)

-- }}}