local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

function battery_widget()
    -- battery usage widget
    local batwidget = wibox.widget.textbox()

    -- Create the timer to update RAM usage
    local battery_timer = gears.timer({
        timeout = 1,
        call_now = true,
        autostart = true,
        callback = function()
            collectgarbage("collect")
            local stat = awful.spawn.easy_async("cat /sys/class/power_supply/BAT0/capacity", function(stdout)
		    local get_voltage = awful.spawn.easy_async("cat /sys/class/power_supply/BAT0/status", function(volt)
		    battery_voltage = volt:sub(1, -2)
		end)
			
		if battery_voltage == "Discharging" then
		    text = stdout:sub(1, -2) .. "%"
		else
		    text = "󱐋 " ..stdout:sub(1, -2) .. "%"
		end
                batwidget:set_text(text)

            end)
        end
    })

    return batwidget
end
