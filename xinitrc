# Swap Ctrl and CapsLock keys
setxkbmap -option 'ctrl:swapcaps'

# Enable multimedia keys
xbindkeys

xrdb -merge ~/.Xresources
xrdb -merge ~/.config/Xresources/base16-tomorrow-night.Xresources

# Start i3
exec i3
