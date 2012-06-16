#!/bin/sh

#exec xmodmap -e "keycode 140 = XF86AudioMute" &
exec setxkbmap -option ctrl:nocaps &
exec xcompmgr &
exec xscreensaver &
exec xset r rate 250 100 &

# need this for #define to work, apparently
exec xrdb -merge ~/.Xdefaults &
#/usr/local/bin/touchpad_disable/start_disable_xinput_listen &
/home/sarumont/.dropbox-dist/dropbox start &
exec awesome
