local freedesktop = require('freedesktop')
local beautiful = require('beautiful')

local terminal = require('apps-conf').default.terminal

local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", terminal .. " -e 'man awesome'" },
    { "edit config", terminal .."vi " .. os.getenv("HOME") .. "/.config/awesome/rc.lua" },
    { "arandr", "arandr" },
    { "restart", awesome.restart },
}

local mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or 16,
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        --{ "Atom", "atom" },
        -- other triads can be put here
    },
    after = {
        { "Terminal", terminal },
        { "Log out", function() awesome.quit() end },
        { "Sleep", "systemctl suspend" },
        { "Restart", "systemctl reboot" },
        { "Exit", "systemctl poweroff" },
        -- other triads can be put here
    }
})

--mymainmenu:get_root().wibox:connect_signal("mouse::leave", function() mymainmenu:hide() end)

return mymainmenu
