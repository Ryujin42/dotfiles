local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

require "ui.bar.launcher"
require "ui.bar.taglist"
require "ui.bar.tasklist"
local cpu_widget = require("ui.bar.cpu")
require "ui.bar.ram"
require "ui.bar.layoutbox"
require "ui.bar.wifi"
local bluetooth_widget = require("ui.bar.bluetooth")
require "ui.bar.settings"
require "ui.bar.battery"
local logout_popup = require("modules.widgets.logout-popup.logout-popup")


beautiful.init("/home/ryujin/.config/awesome/custom_theme.lua")


function add_element(element, shape, margins)
    return {

        {
            element,
            widget = wibox.container.background,
            shape = shape,
            bg = beautiful.bar_element_bg,
            shape_border_color = beautiful.bar_element_border,
            shape_border_width = beautiful.bar_element_border_width,
        },
        widget = wibox.container.margin,
        top = margins,
        bottom = margins,
    }
end

function add_space(width)
    return {
        nil,
        widget = wibox.container.margin,
        margins = width
    }
end


function set_bar(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = 48,
        bg = beautiful.transparent,
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        widget = wibox.container.margin,
        top = 4,
        left = 4,
        right = 4,
        {
            widget = wibox.container.background,
            bg = beautiful.bar_bg,
            shape = gears.shape.rounded_rect,
            shape_border_width = beautiful.bar_element_border_width,

            {
                layout = wibox.layout.align.horizontal,
                {
                    -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    add_element(get_launcher(), gears.shape.rounded_rect),
                    add_space(5),
                    add_element(taglist(s)),
                },
                {
                    layout = wibox.layout.fixed.horizontal,
                    add_element(wibox.widget {
                        widget = wibox.widget.separator,
                        orientation = "vertical",
                        span_ratio = 0.7,
                        forced_width = 2,}),
                    add_space(5),
                    add_element(tasklist(s)),
                },
                {
                    -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    add_element(),
                    add_element(cpu_widget({
                        width = 70,
                        step_width = 2,
                        step_spacing = 0,
                        color = '#434c5e'
                    })),
                    add_space(5),
                    add_element(ram_widget()),
                    add_space(5),
                    add_element(awful.widget.keyboardlayout()),
                    add_space(5),
                    add_element(wibox.widget.textclock()),
                    add_space(5),
                    -- add_element(bluetooth_widget.new()),
                    -- add_space(5),
                    add_element(battery_widget()),
                    add_space(5),
                    -- add_element(logout(s),gears.shape.circle, 12),
                    logout_popup.widget{icon=beautiful.power_button},
                    add_space(5),
                },
            },
        },
    }

    s.mywibox:connect_signal("property::geometry", function()
        local geo = s.mywibox:geometry()
        local wallpaper = beautiful.wallpaper
    
        if wallpaper then
            gears.wallpaper.maximized(wallpaper, 1, { x = geo.x, y = geo.y, width = geo.width, height = geo.height }, true)
        end
    end)
end
