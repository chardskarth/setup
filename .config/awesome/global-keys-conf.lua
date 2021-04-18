local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup').widget

local modkey = 'Mod4'
local altkey = 'Mod1'


local apps = _G.my_apps

local globalKeys = awful.util.table.join(
  -- awesome
  awful.key({modkey}, 'F1', hotkeys_popup.show_help, {description = 'Show help', group = 'awesome'}),
  awful.key(
    {modkey},
    'space',
    function()
      awful.spawn('rofi -combi-modi window,drun -show combi -modi combi')
    end,
    {description = 'Show main menu', group = 'awesome'}
	),
  awful.key(
    {modkey, 'Control', altkey},
    'l',
    function()
      --awful.spawn(apps.default.lock)
      _G.exit_screen_show()
    end,
    {description = 'Lock the screen', group = 'awesome'}
  ),
  awful.key({modkey, 'Control'}, 'r', _G.awesome.restart, {description = 'reload awesome', group = 'awesome'}),
  --awful.key({modkey, 'Control'}, 'q', _G.awesome.quit, {description = 'quit awesome', group = 'awesome'}),

  -- directions.change.focus
  awful.key({modkey}, 'h', function() awful.client.focus.bydirection("left") end, {description = 'focus left client', group = 'directions.focus'}),
  awful.key({modkey}, 'j', function() awful.client.focus.bydirection("down") end, {description = 'focus down client', group = 'directions.focus'}),
  awful.key({modkey}, 'k', function() awful.client.focus.bydirection("up") end, {description = 'focus up client', group = 'directions.focus'}),
  awful.key({modkey}, 'l', function() awful.client.focus.bydirection("right") end, {description = 'focus right client', group = 'directions.focus'}),

  -- directions.change.swap
  awful.key({modkey, 'Shift'}, 'h', function() awful.client.swap.bydirection("left") end, {description = 'focus left client', group = 'directions.swap'}),
  awful.key({modkey, 'Shift'}, 'j', function() awful.client.swap.bydirection("down") end, {description = 'focus down client', group = 'directions.swap'}),
  awful.key({modkey, 'Shift'}, 'k', function() awful.client.swap.bydirection("up") end, {description = 'focus up client', group = 'directions.swap'}),
  awful.key({modkey, 'Shift'}, 'l', function() awful.client.swap.bydirection("right") end, {description = 'focus right client', group = 'directions.swap'}),

  -- directions.resize
 awful.key(
    {modkey},
    'Right',
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = 'Increase master width factor', group = 'directions.resize'}
  ),
  awful.key(
    {modkey},
    'Left',
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = 'Decrease master width factor', group = 'directions.resize'}
  ),
  awful.key(
    {modkey},
    'Down',
    function()
      awful.client.incwfact(0.05)
    end,
    {description = 'Decrease master height factor', group = 'directions.resize'}
  ),
  awful.key(
    {modkey},
    'Up',
    function()
      awful.client.incwfact(-0.05)
    end,
    {description = 'Increase master height factor', group = 'directions.resize'}
  ),

  -- Programms
  awful.key(
    {modkey},
    'Print',
    function()
      awful.spawn.with_shell(apps.default.delayed_screenshot)
    end,
    {description = 'Mark an area and screenshot it 10 seconds later (clipboard)', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {modkey},
    'p',
    function()
      awful.spawn.with_shell(apps.default.screenshot)
    end,
    {description = 'Take a screenshot of your active monitor and copy it to clipboard', group = 'screenshots (clipboard)'}
  ),
  awful.key(
    {altkey, 'Shift'},
    'p',
    function()
      awful.util.spawn_with_shell(apps.default.region_screenshot)
    end,
    {description = 'Mark an area and screenshot it to your clipboard', group = 'screenshots (clipboard)'}
  ),

  -- launchers
  awful.key(
    {modkey},
    'Return',
    function()
      awful.util.spawn_with_shell(apps.default.dmenu)
    end,
    {description = 'Open with dmenu', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'e',
    function()
      awful.util.spawn(apps.default.files)
    end,
    {description = 'Open filebrowser', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'c',
    function()
      awful.util.spawn(apps.default.editor)
    end,
    {description = 'Open a text/code editor', group = 'launcher'}
  ),
  awful.key(
    {modkey},
    'b',
    function()
      awful.util.spawn(apps.default.browser)
    end,
    {description = 'Open a browser', group = 'launcher'}
  ),
  -- Standard program
  awful.key(
    {modkey},
    'x',
    function()
      awful.spawn(apps.default.terminal)
    end,
    {description = 'Open a terminal', group = 'launcher'}
	),

	-- layout
  awful.key(
    {modkey, 'Shift'},
    'Left',
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = 'Increase the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'Right',
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = 'Decrease the number of master clients', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Left',
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = 'Increase the number of columns', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Control'},
    'Right',
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = 'Decrease the number of columns', group = 'layout'}
  ),
  --[[awful.key(
    {modkey},
    'space',
    function()
      awful.layout.inc(1)
    end,
    {description = 'Select next', group = 'layout'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'space',
    function()
      awful.layout.inc(-1)
    end,
    {description = 'Select previous', group = 'layout'}
	),]]

  -- Screen management
  awful.key(
    {modkey},
    'o',
    awful.client.movetoscreen,
    {description = 'move window to next screen', group = 'client'}
	),
  awful.key(
    {modkey, 'Control'},
    'n',
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        _G.client.focus = c
        c:raise()
      end
    end,
    {description = 'restore minimized', group = 'client'}
	),

  --[[ Dropdown application.... wth is quake?
  awful.key(
    {modkey},
    'z',
    function()
      _G.toggle_quake()
    end,
    {description = 'dropdown application', group = 'launcher'}
  ),]]
  -- Widgets popups
  --[[awful.key(
    {altkey},
    'h',
    function()
      if beautiful.fs then
        beautiful.fs.show(7)
      end
    end,
    {description = 'Show filesystem', group = 'widgets'}
  ),
  awful.key(
    {altkey},
    'w',
    function()
      if beautiful.weather then
        beautiful.weather.show(7)
      end
    end,
    {description = 'Show weather', group = 'widgets'}
	),--]]

  -- Brightness
  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('xbacklight -inc 10')
    end,
    {description = '+10%', group = 'misc'}
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('xbacklight -dec 10')
    end,
    {description = '-10%', group = 'misc'}
  ),
  -- ALSA volume control
  awful.key(
    {},
    'XF86AudioRaiseVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%+')
    end,
    {description = 'volume up', group = 'misc'}
  ),
  awful.key(
    {},
    'XF86AudioLowerVolume',
    function()
      awful.spawn('amixer -D pulse sset Master 5%-')
    end,
    {description = 'volume down', group = 'misc'}
  ),
  awful.key(
    {},
    'XF86AudioMute',
    function()
      awful.spawn('amixer -D pulse set Master 1+ toggle')
    end,
    {description = 'toggle mute', group = 'misc'}
  ),
  awful.key(
    {},
    'XF86AudioNext',
    function()
      --
    end,
    {description = 'toggle mute', group = 'misc'}
  ),
  awful.key(
    {},
    'XF86PowerDown',
    function()
      --
    end,
    {description = 'toggle mute', group = 'misc'}
  ),
  awful.key(
    {},
    'XF86PowerOff',
    function()
      _G.exit_screen_show()
    end,
    {description = 'toggle mute', group = 'misc'}
	),


  -- Open default program for tag
  awful.key(
    {modkey},
    't',
    function()
      awful.spawn(
          awful.screen.focused().selected_tag.defaultApp,
          {
            tag = _G.mouse.screen.selected_tag,
            placement = awful.placement.bottom_right
          }
        )
    end,
    {description = 'Open default program for tag/workspace', group = 'tag'}
  ),
  -- Custom misc
  -- vfio integration
  awful.key(
    {'Control',altkey},
    'space',
    function()
      awful.util.spawn_with_shell('vm-attach attach')
    end
  ),
  -- Lutris hotkey
  awful.key(
    {modkey},
    'g',
    function()
      awful.util.spawn_with_shell('lutris')
    end
  ),
  -- System Monitor hotkey
  awful.key(
    {modkey},
    'm',
    function()
      awful.util.spawn_with_shell('mate-system-monitor')
    end
  ),
  -- Kill VLC
  awful.key(
    {modkey},
    'v',
    function()
      awful.util.spawn_with_shell('killall -9 vlc')
    end
  )
  -- Emoji Picker
  -- awful.key(
  --   {modkey},
  --   'a',
  --   function()
  --     awful.util.spawn_with_shell('ibus emoji')
  --   end,
  --   {description = 'Open the ibus emoji picker to copy an emoji to your clipboard', group = 'misc'}
  -- )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
  local descr_view, descr_toggle, descr_move, descr_toggle_focus
  if i == 1 or i == 9 then
    descr_view = {description = 'view tag #', group = 'tag'}
    descr_toggle = {description = 'toggle tag #', group = 'tag'}
    descr_move = {description = 'move focused client to tag #', group = 'tag'}
    descr_toggle_focus = {description = 'toggle focused client on tag #', group = 'tag'}
  end
  globalKeys =
    awful.util.table.join(
    globalKeys,
    -- View tag only.
    awful.key(
      {modkey},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      descr_view
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, 'Control'},
      '#' .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      descr_toggle
    ),
    -- Move client to tag.
    awful.key(
      {modkey, 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:move_to_tag(tag)
          end
        end
      end,
      descr_move
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, 'Control', 'Shift'},
      '#' .. i + 9,
      function()
        if _G.client.focus then
          local tag = _G.client.focus.screen.tags[i]
          if tag then
            _G.client.focus:toggle_tag(tag)
          end
        end
      end,
      descr_toggle_focus
    )
  )
end

_G.root.keys(globalKeys)


local contextMenu = require('module.context-menu')
local globalButtons = awful.util.table.join(
    awful.button({ }, 3, function () contextMenu:toggle() end)
)

_G.root.buttons(globalButtons)


return {
	globalkeys = globalkeys,
	modkey = modkey,
	altkey = altkey
}
