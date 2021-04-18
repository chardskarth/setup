local awful = require('awful')
local gears = require('gears')

local keys = require('global-keys-conf')
local modkey = keys.modkey
local altkey = keys.altkey


local client_buttons = awful.util.table.join(
  awful.button({},1,function(c)
      _G.client.focus = c
      c:raise()
  end),
  awful.button({modkey}, 1, awful.mouse.client.move),
  awful.button({modkey}, 3, awful.mouse.client.resize),
  awful.button({modkey}, 4, function()
      awful.layout.inc(1)
  end),
  awful.button({modkey}, 5, function()
      awful.layout.inc(-1)
  end)
)


local client_keys = awful.util.table.join(
  awful.key(
    {modkey}, 'f', function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = 'toggle fullscreen', group = 'client'}
  ),
  awful.key({modkey}, 'q',
    function(c)
      c:kill()
    end,
    {description = 'close', group = 'client'}
  )
)


-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  {
    rule_any = {name = {'QuakeTerminal'}},
    properties = {skip_decoration = true}
  },
  -- Titlebars
  {
    rule_any = {type = {'dialog'}, class = {'Wicd-client.py', 'calendar.google.com'}},
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  }
}
