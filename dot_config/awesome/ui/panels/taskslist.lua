-- Standard awesome library
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")


-- {{{ Wibar

screen.connect_signal("request::desktop_decoration", function(s)

	-- Create a tasklist widget
	-- s.mytasklist = awful.widget.tasklist({
	-- 	screen = s,
	-- 	filter = awful.widget.tasklist.filter.allscreen,
	-- 	buttons = {
	-- 		awful.button({}, 1, function(c)
	-- 			c:activate({ context = "tasklist", action = "toggle_minimization" })
	-- 		end),
	-- 		awful.button({}, 3, function()
	-- 			awful.menu.client_list({ theme = { width = 250 } })
	-- 		end),
	-- 		awful.button({}, 4, function()
	-- 			awful.client.focus.byidx(-1)
	-- 		end),
	-- 		awful.button({}, 5, function()
	-- 			awful.client.focus.byidx(1)
	-- 		end),
	-- 	},
	-- })

	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.allscreen,
		buttons = awful.util.table.join(
			-- Left click to focus
			awful.button({}, 1, function(c)
				c:activate({ context = "tasklist", switch_to_tag = true, action = "toggle_minimization" })
			end),
			-- Right click: Open all active clients across all tags
			awful.button({}, 3, function()
				awful.menu.client_list({ theme = { width = 250 } })
			end)
		),
		layout   = {
			spacing_widget = {
				{
					forced_width  = 5,
					forced_height = 24,
					thickness     = 1,
					color         = "#777777",
					widget        = wibox.widget.separator
				},
				valign = "center",
				halign = "center",
				widget = wibox.container.place,
			},
			spacing = 1,
			layout  = wibox.layout.fixed.horizontal
		},
		widget_template = {
			{
				{
					id = "icon",
					widget = awful.widget.clienticon,
				},
				id = "icon_container",
				widget = wibox.container.background,
			},
			margins = 2,
			widget = wibox.container.margin,
			-- Set the tasklist widget size to the size of the icon
			update_callback = update_tasklist_item,
		},
	})

	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "bottom",
		screen = s,
		widget = {
			layout = wibox.layout.align.horizontal,
			s.mytasklist, -- Middle widget
		},
	})
end)

-- }}}