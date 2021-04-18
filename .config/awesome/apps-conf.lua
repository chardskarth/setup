
local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'
local dmenu_command = 'dmenu_run -h 20 -nb "#192933" -nf "#d3d7cf" -fn "JetBrainsMono Nerd Font Mono:size=9"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'terminator',
--    terminal = 'lxterminal',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'terminator',
    screenshot = 'flameshot screen -p ~/Pictures',
    region_screenshot = 'flameshot gui -p ~/Pictures',
    delayed_screenshot = 'flameshot screen -p ~/Pictures -d 5000',
    browser = 'qutebrowser',
    editor = 'code', -- gui text editor
    social = 'discord',
    game = rofi_command,
    files = 'nautilus',
    music = rofi_command,
    dmenu = dmenu_command,
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    --'compton --config ' .. filesystem.get_configuration_dir() .. 'conf/compton.conf',
    'picom --config ' .. filesystem.get_configuration_dir() .. 'conf/picom.conf',
    'nm-applet --indicator', -- wifi
    -- 'pnmixer', -- shows an audiocontrol applet in systray when installed.
    -- 'blueberry-tray', -- Bluetooth tray icon
    'numlockx on', -- enable numlock
    '/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    'xfce4-power-manager', -- Power manager
     'flameshot',
     'synology-drive -minimized',
     'steam -silent',
    'feh --randomize --bg-fill ~/.wallpapers/*',
    'variety --current', -- added --current to prevent window display
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/scripts/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'barrier -f -c ' .. filesystem.get_configuration_dir() .. 'conf/barrier.conf --name raspberrypi --enable-crypto --address :24800',
  }
}
