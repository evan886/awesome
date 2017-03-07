require("lib/error")
require("variables")
require("lib/wallpaper")
require("lib/tag")
require("menu")
require("lib/wibox")
require("lib/mouse")
require("lib/key")
require("rule")
require("lib/signals")

-- by evan 20170307 Ctrl + Atl + l 锁屏：
-- -- 因为 Windows 中是 Win + L ，但在 awesome 中 Win + L 已经被用来干其他事情了
-- awful.key({"Mod1", "Control"}, "l", function ()
--     awful.util.spawn('xscreensaver-command -lock')
--     end)

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
--modkey = "Mod4"

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
--for i = 1, 9 do
--    globalkeys = awful.util.table.join(globalkeys,
--        -- View tag only.
--        awful.key({ modkey }, "#" .. i + 9,
--                  function ()
--                        local screen = awful.screen.focused()
--                        local tag = screen.tags[i]
--                        if tag then
--                           tag:view_only()
--                        end
--                  end,
--                  {description = "view tag #"..i, group = "tag"}),
--        -- Toggle tag display.
--        awful.key({ modkey, "Control" }, "#" .. i + 9,
--                  function ()
--                      local screen = awful.screen.focused()
--                      local tag = screen.tags[i]
--                      if tag then
--                         awful.tag.viewtoggle(tag)
--                      end
--                  end,
--                  {description = "toggle tag #" .. i, group = "tag"}),
--        -- Move client to tag.
--        awful.key({ modkey, "Shift" }, "#" .. i + 9,
--                  function ()
--                      if client.focus then
--                          local tag = client.focus.screen.tags[i]
--                          if tag then
--                              client.focus:move_to_tag(tag)
--                          end
--                     end
--                  end,
--                  {description = "move focused client to tag #"..i, group = "tag"}),
--        -- Toggle tag on focused client.
--        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
--                  function ()
--                      if client.focus then
--                          local tag = client.focus.screen.tags[i]
--                          if tag then
--                              client.focus:toggle_tag(tag)
--                          end
--                      end
--                  end,
--                  {description = "toggle focused client on tag #" .. i, group = "tag"})
--    )
--end

--clientbuttons = awful.util.table.join(
--    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
--    awful.button({ modkey }, 1, awful.mouse.client.move),
--    awful.button({ modkey }, 3, awful.mouse.client.resize))
