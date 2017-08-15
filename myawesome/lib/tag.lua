-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
    -- www / dev / im / dev / dev / dev / media / util / nautilus
    names = {'`1:WEB', "2:workstation",  "3:windows", "4:Develop", "5:D", "6:M", "7:U", "8:M","9:chat"},
    --names = {'`:workstation', "2:WEB", "3:windows", "q:D", "w:D", "e:M", "a:U", "s:M"},
    layouts = {
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.floating,
        awful.layout.suit.floating
    }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    if s == 1 then
        tags[s] = awful.tag(tags.names, s, tags.layouts)
    else -- The second screen
        tags[s] = awful.tag(tags.names, s, awful.layout.suit.tile)
    end
end
-- }}}

