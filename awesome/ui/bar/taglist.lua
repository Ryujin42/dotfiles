local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
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
    awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end)
)

function taglist(s)
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    tag_list = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        font = beautiful.nerd_font,
        buttons = taglist_buttons,
        layout = {
            spacing = 1,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        id = 'icon_role',
                        widget = wibox.widget.textbox,
                    },
                    margins = 2,
                    widget = wibox.container.margin,
                },
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox,
                    forced_width = 24,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left = 6,
            right = 3,
            widget = wibox.container.margin,
            create_callback = function(self, tag, index, tags)
                if tag.selected then
                    -- self:get_children_by_id('text_role')[1].markup = "<span color='#ff0000'></span>"
                    tag.name = ""
                else
                    -- self:get_children_by_id('text_role')[1].markup = "<span color='#00ff00'></span>"
                    tag.name = ""
                end
                if #tag:clients() == 0 then
                    tag.name = ""
                end
            end,
            update_callback = function(self, tag, index, tags)
                if tag.selected then
                    -- self:get_children_by_id('text_role')[1].markup = "<span color='#ff0000'></span>"
                    tag.name = ""
                else
                    -- self:get_children_by_id('text_role')[1].markup = "<span color='#00ff00'></span>"

                    tag.name = ""
                end
                if #tag:clients() == 0 then
                    tag.name = ""
                end
            end,
        },

    }

    return tag_list
end
