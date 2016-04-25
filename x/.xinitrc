#!/bin/sh

#==============================================================================#
#                                    XINITRC                                   #
#==============================================================================#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Disable energy star feature
xset -dpms
# Merge user config
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr &

# Fonts
xset +fp /usr/share/fonts/local
xset fp rehash

export GDK_USE_XFT=1
export QT_XFT=true

pulseaudio --start -D
compton &
tilda &

if hostname | grep -q laptop ; then
    syndaemon -i1 -k d &
    xset s off
    setterm -powersave off -blank 0 -powerdown 0
    xrandr --output eDP1 --primary
    # xmodmap -e 'clear Lock' &
    # unclutter -grab -noevents -root &
else
    mpd ~/.config/mpd/mpd.conf
    # needed because frequency is set to 60 by default
    xrandr --output DVI-D-1 --mode 1920x1080 --rate 144.00 --primary
    xrandr --output DP-1 --rotate left
    xset m 1/1 4
fi

if [ -f ~/pictures/wallpaper ]; then
    hsetroot -tile ~/pictures/wallpaper
else
    hsetroot -solid "#373b41"
fi

case $@ in
    *i3*)
        exec i3 -V >> /tmp/i3log-$(date +'%F-%k-%M-%S') 2>&1
        ;;
    *)
        wmname LG3D
        sxhkd -m 1 -f 60 >/tmp/sxhkd.log 2>&1 &
        exec bspwm >/tmp/bspwm.log 2>&1
        ;;
esac
