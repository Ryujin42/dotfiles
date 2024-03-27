local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

function settings(s)
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    settings_button = awful.widget.launcher({
        -- image = "/home/ryujin/.config/awesome/assets/ryujin/logo.png",
        image = beautiful.settings_button,
        command = "rofi -show drun"
    })

    return settings_button
end