#!/bin/bash
xrandr | grep primary | awk '{print $1}'
