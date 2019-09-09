#!/bin/bash

screens=($(./screen_list.sh))

if [ -z "$CURRENT_SCREEN" ]
then
	CURRENT_SCREEN=${screens[0]}
	echo "Setting var to first value"
else
	echo "Using last value"
fi

echo "current screen is $CURRENT_SCREEN"

