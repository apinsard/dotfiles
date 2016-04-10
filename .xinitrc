test -f ~/.Xkeymap && xkbcomp ~/.Xkeymap $DISPLAY || setxkbmap us_intl
xset -b
xrandr --output HDMI-1 --mode 1920x1080 --left-of VGA-1
xrdb ~/.Xresources
exec dbus-launch --sh-syntax --exit-with-session qtile
