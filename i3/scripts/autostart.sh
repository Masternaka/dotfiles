# Script for autostart applications

# Screen configuration (replace with your screen configuration) (install arandr to manage screen configuration)
xrandr --output HDMI-1 --off --output HDMI-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-3 --off

# Attendre 1 secondes pour que le système ait le temps de configurer les écrans
sleep 1

# Active le picom (compositor)
killall picom
while pgrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf --vsync &

# Active Polybar (barre de statut)
~/.config/polybar/polybar-i3 &

# Active le fond d'écran (remplacer par le fond d'écran de votre choix)
feh --bg-fill ~/.config/i3/wallpaper/wallhaven-yq5ywl.png &

# Active le dunst (gestionnaire de notifications)
dunst -config ~/.config/i3/dunst/dunstrc &

# Active le tiling automatique (gestion du tiling)
autotiling &

# Active le polkit (gestionnaire de permissions)
polkit-gnome-authentication-agent-1 &

# Active le sxhkd (gestionnaire de raccourcis)
pkill -x sxhkd
sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
