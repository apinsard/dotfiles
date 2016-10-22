test -f ~/.Xkeymap && xkbcomp ~/.Xkeymap $DISPLAY || setxkbmap us_intl
xset -b
xrandr --output VGA-1 --mode 1920x1080 --left-of HDMI-1
xrdb ~/.Xresources
exec dbus-launch --sh-syntax --exit-with-session qtile
