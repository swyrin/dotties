#!/bin/sh

# Selects player based on if they're playing or if they have a cover
# Note: Being played takes priority
select_player () {
	playingplayer=""
	coverplayer=""
	totalplayer=""
	playerctl -l | while read -r player;
	do
		art=`playerctl --player="$player" metadata mpris:artUrl 2> /dev/null`
		status=`playerctl --player="$player" status 2> /dev/null`
		[[ $status == "Playing" ]] && playingplayer="$player"
		[[ $art != "" ]] && coverplayer="$player"
		[[ $status == "Playing" && $art != "" ]] && totalplayer="$player"
		[[ ! -z $coverplayer ]] && player="$coverplayer"
		[[ ! -z $playingplayer ]] && player="$playingplayer"
		[[ ! -z $totalplayer ]] && player="$totalplayer"
		echo "$player"
	done;
}
	

# Get general info 
eww="eww -c $HOME/.config/eww/hosf"
# player=`select_player | tail -1`
player=`cat $HOME/.config/polybar/.curplayer.log`
status=`playerctl --player="$player" status`
[[ $status == "" ]] && exit

# Toggle play pause and update status accordingly
toggle () {
    [[ $status == "Playing" ]] && $eww update media_status=""|| $eww update media_status=""
    playerctl --player="$player" play-pause
}

# Seek to an specific time 
seek () {
    seekt="$1"    
    position=`playerctl --player=$player position`    
    if [[ $? -eq 0 ]] && [[ `python -c "print(round(abs($seekt-$position)))"` -gt 3 ]]  
    then
        playerctl --player=$player position $seekt
    fi;
}

# Rewind or fast forward 5 seconds
move () {
	move="$1"             
    startpos=`playerctl --player=$player position`	
	length=`playerctl --player="$player" metadata mpris:length`
	length=`python -c "print($length/1000000)"`
	if [[ $? -eq 0 ]]
	then
		endpos=`python -c "print(min($length, max(0, $startpos $move)))"`
		playerctl --player=$player position $endpos
	fi;
}
	

case $1 in
    --toggle )
        toggle
        ;;
	--seek )
		seek $2
		;;
	--move )
		move $2
		;;
	--next )
		playerctl --player=$player next
		;;
	--prev )
		playerctl --player=$player previous
		;;
esac
