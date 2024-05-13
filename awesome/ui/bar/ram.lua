local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

function ram_widget()
    -- RAM usage widget
    local memwidget = wibox.widget.textbox()

    -- Update RAM widgets

    local total_ram = 0
    local used_ram = 0
    local ram_percentage = 0

    -- Create the timer to update RAM usage
    local ram_timer = gears.timer({
        timeout = 1,
        call_now = true,
        autostart = true,
        callback = function()
            collectgarbage("collect")
            local stat = awful.spawn.easy_async("free -m", function(stdout)
                total_ram = string.match(stdout, "Mem:%s+(%d+)")
                used_ram = string.match(stdout, "Mem:%s+%d+%s+(%d+)")
                memwidget:set_text(used_ram .. "Mo\n" .. total_ram .. "Mo")
            end)
        end
    })

    return memwidget
end
