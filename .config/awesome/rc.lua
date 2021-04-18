--[[
    Custom awesomewm theme by cskth
    powerarrow-dark + titus
]]
local gears = require('gears.debug')
local naughty = require('naughty')
local beautiful = require('beautiful')
local awful = require('awful')
require('awful.autofocus')

-- {{{ Error handling

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify {
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    }
end

_G.my_theme = require('theme')

_G.my_apps = require('apps-conf')
require('client-rules-conf')
require('global-keys-conf')

require('module.exit-screen')
require('module.autostart-runner')(my_apps.run_on_start_up)
require('module.context-menu')

-- Y! client rules configuration
-- Y! global keys configuration
-- Y! apps table
-- Y! scripts
-- Y!    awspawn
-- Y!    screenshot
--
-- theme
-- Y!  border_adjust on focus
--   tag list & taglist icon
--   layouts config
--   top panel
--   clients list
--   other system widgets
--   context menu (freedesktop)
-- various_modules
-- Y!   autostart-runner
-- Y!   exit screen
--    quake-terminal
--    backdrop?? whats this titus?
--    notifications -- this seems important but I dont know how to use this really
