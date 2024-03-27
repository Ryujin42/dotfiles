local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

function get_launcher()

    launcher = awful.widget.launcher({
        image = beautiful.main_logo,
        command = "rofi -show drun"
    })
    
    return launcher
end