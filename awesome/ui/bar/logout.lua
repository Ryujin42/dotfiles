local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local logout_popup = require("modules.widgets.logout-popup.logout-popup")


function logout(s)
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    logout_button = awful.widget.launcher({
        -- image = "/home/ryujin/.config/awesome/assets/ryujin/logo.png",
        image = beautiful.power_button,
        command = logout_popup.launch()
    })

    return logout_button
end