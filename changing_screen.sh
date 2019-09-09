#!/bin/bash
current_screen=$(xrandr | grep connected | grep "+" | awk 'NR==1{print $1}')
screens=($(xrandr | grep " connected" | awk '{print $1}'))

# If only one screen is connected
if [ "${#screens[@]}" = "1" ]; then
        echo "Only one screen active : Resetting it"
		xrandr --output $screens --auto
        exit
fi

# Determining next screen
next_screen=""
for i in ${!screens[@]}; do
        if [ "${screens[$i]}" = "$current_screen" ]; then
                let j=i+1
                if [ ! -z "${screens[$j]}" ]; then
                        next_screen="${screens[$j]}"
                        break
                fi
        fi
done

# If there is no next screen (current is last), then we choose the first one
if [ -z "$next_screen" ]; then
	next_screen="${screens[0]}"
fi

# Changing active screen
echo "next screen is $next_screen"

if [ -z "$next_screen" ]; then
	echo "Next screen not found. Aborting!"
else
	xrandr --output $current_screen --off
	xrandr --output $next_screen --auto
fi
