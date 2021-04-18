local gtable = require('gears.table')
local beautiful = require('beautiful')
local awful = require('awful')

local apps = require('apps-conf')
local getTags = require('tags-conf')
local clickable_container = require('theme.titus.widget.material.clickable-container')

-- {{{ SETUP Screen, Theme, Wibar Tags
local icons = require('theme.titus.icons')
local my_theme = {
  clickable_container = clickable_container,
  icons = icons
}
local my_tags = getTags(apps, icons, clickable_container)
local tags = my_tags.tags
awful.util.taglist_buttons = my_tags.taglist_buttons
awful.util.taglist_list_update = my_tags.taglist_list_update
local final_theme = require('theme.powerarrow-custom.theme')
beautiful.init(final_theme)

-- Pomodoro needs to be init after beautiful.init
local pomodoro = require('pomodoro')
pomodoro.format = function (t) return "\u{e003} [ <b>" .. t .. "</b> ]" end
pomodoro.init()

-- Reset wallpaper when a screen's geometry changes (e.g. different resolution)
_G.screen.connect_signal( "property::geometry", function(s) beautiful.wallpaper.maximized( beautiful.wallpaper, s, beautiful.wallpapers) end )

-- Signal function to execute when a new client appears.
_G.client.connect_signal(
  'manage',
  function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not _G.awesome.startup then
      awful.client.setslave(c)
    end

    if _G.awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end
)

-- client decorations
local clientDecor = require('theme.titus.decorate-client')
local clientCallback = clientDecor.clientCallback
local tagCallback = clientDecor.tagCallback
local renderClient = clientDecor.renderClient

_G.client.connect_signal('manage', clientCallback)

_G.client.connect_signal('unmanage', clientCallback)

_G.client.connect_signal('property::hidden', clientCallback)

_G.client.connect_signal('property::minimized', clientCallback)

_G.client.connect_signal(
  'property::fullscreen',
  function(c)
    if c.fullscreen then
      renderClient(c, 'maximized')
    else
      clientCallback(c)
    end
  end
)

_G.tag.connect_signal('property::selected', tagCallback)

_G.tag.connect_signal('property::layout', tagCallback)

-- Make the focused window have a glowing border
_G.client.connect_signal(
  'focus',
  function(c)
    c.border_color = beautiful.border_focus
  end
)
_G.client.connect_signal(
  'unfocus',
  function(c)
    c.border_color = beautiful.border_normal
  end
)

-- connect wibar to each screen
awful.screen.connect_for_each_screen(function(s)
  for i, tag in pairs(tags) do
    awful.tag.add(
      i,
      {
        icon = tag.icon,
        icon_only = true,
        layout = awful.layout.suit.tile,
        gap_single_client = true,
        gap = 4,
        screen = s,
        defaultApp = tag.defaultApp,
        selected = i == 1
      }
    )
  end
  beautiful.at_screen_connect(s)
end)

return my_theme