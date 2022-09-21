focusedwindow=$(xdotool getactivewindow)
flameshot gui  >/dev/null
if [ "$focusedwindow" == "$(xdotool getactivewindow)" ]
then
	xdotool windowfocus $focusedwindow
fi
