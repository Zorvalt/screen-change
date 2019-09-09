#!/bin/bash
screens=($(./screen_list.sh))
current_screen=$(xrandr | grep connected | grep "+" | awk 'NR==1{print $1}')

if [ "${#screens[@]}" = "1" ]; then
	echo "$screens"
	exit
fi

for i in ${!screens[@]}; do
	if [ "${screens[$i]}" = "$current_screen" ]; then
		let j=i+1
		if [ ! -z "${screens[$j]}" ]; then
			echo "${screens[$j]}"
			exit
		fi
	fi
done
echo "${screens[0]}"
