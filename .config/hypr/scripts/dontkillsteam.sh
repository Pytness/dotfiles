function contains() {
    [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]] && return 0 || return 1
}

window_class=$(hyprctl activewindow -j | jq -r ".class")

dont_close_classes="Steam Enpass"

if [ $(contains $dont_close_classes $window_class) -ne 0 ]; then
    xdotool windowunmap $(xdotool getactivewindow)
else
    hyprctl dispatch killactive ""
fi
