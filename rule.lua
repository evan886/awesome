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

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    --{rule = {class = "Firefox", name = "Navigator"},
      --properties = {tag = tags[1][2]}},
    --{rule = {class = "Firefox", name = "Browser"},
      --properties = {floating = true}},
    --{rule = {class = "Firefox", name = "Download"},
      --properties = {floating = true}},
    --{rule = {class = "Gvim"},
      --properties = {tag = tags[1][2]}},
    {rule = {class = "Chromium"},
      properties = {tag = tags[1][2]}},
    --{rule = {class = "Thunderbird"},
      --properties = {tag = tags[1][8]}},
    {rule = {class = "VirtualBox"},
      properties = {floating = true, tag = tags[1][4]}},
    {rule = {class = "Smplayer"},
     properties = {floating = true, tag = tags[1][7]}},
    {rule = {class = "MPlayer"},
     properties = {floating = true}, tag = tags[1][7]},
    --{ rule = { class = "pinentry" },
      --properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    {rule = {class = "Goldendict"},
      properties = {floating = true}},
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}
