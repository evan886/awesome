local switch = {}

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


-- local table = table
-- local mouse = require("mouse")
--local client = require("client")


local mouse_position = {}
local last_tag = 1

-- Init mouse position
for s = 1, screen.count() do
    mouse_position[s] = {}
    for t =  1, 9 do
        local screen_geometry = screen[s].workarea
        mouse_position[s][t] = {
            x = screen_geometry.x + screen_geometry.width / 2,
            y = screen_geometry.y + screen_geometry.height / 2,
        }
    end
end

function switch.get_last_tag()
    return last_tag
end

-- save tag status
function switch.save_tag_status(s, t)
    if s == nil then
        s = client.focus and client.focus.screen or mouse.screen
    end
    if t == nil then
        t = awful.tag.getidx(awful.tag.selected(s))
    end
    mouse_position[s][t] = mouse.coords()
    last_tag = t
end

-- set tag status
function switch.restore_tag_status(s, t)
    if s == nil then
        s = client.focus and client.focus.screen or mouse.screen
    end
    if t == nil then
        t = awful.tag.getidx(awful.tag.selected(s))
    end
    mouse.coords(mouse_position[s][t])
end

-- Switch Tag for multi screen
function switch.tag_switch(tags, i)
    local cs = client.focus and client.focus.screen or mouse.screen
    local tag_idx = awful.tag.getidx(awful.tag.selected(cs))
    if i == tag_idx then
        client_switch_next()
        return -- not current screen
    end
    switch.save_tag_status()
    local ismatched = false
    if tags[cs][i] and #tags[cs][i]:clients() > 0 then
        awful.tag.viewonly(tags[cs][i]) -- current screen's tag is active
    else -- other screen's tag is active
        for j = 1, screen.count() do
            if #tags[j][i]:clients() > 0 then
                awful.tag.viewonly(tags[j][i])
                awful.screen.focus(j)
                ismatched = true
                break
            end
        end
    end
    if not ismatched and tags[cs][i] then
        awful.tag.viewonly(tags[cs][i])
    end
    switch.restore_tag_status()
end

-- Move mouse to client center
function switch.set_mouse_to_client_center()
    local cc = awful.client.next(0)
    local x = cc:geometry().x
    local y = cc:geometry().y
    local width = cc:geometry().width
    local height = cc:geometry().height
    mouse.coords({ x = x + width / 2, y = y + height / 2 })
end

function switch.client_switch(step)
    local s = client.focus and client.focus.screen or mouse.screen
    local t = awful.tag.selected(s)
    if #t.clients(t) < 2 then -- FIXME I prefer tag.clients...
        return
    end
    awful.client.focus.byidx(step)
    switch.set_mouse_to_client_center()
    if client.focus then client.focus:raise() end
end

function switch.client_switch_next()
    switch.client_switch(1)
end

function switch.client_switch_prev()
    switch.client_switch(-1)
end

return switch
