#!/bin/bash

# The original idea was to somehow monitor the CPU usage of the WindowServer process because 
# one of the settings (Status bar) in the iTerm application was consuming CPU resources unnoticed.
# I didn't notice that for a very long time!!! ☹️

# Prerequisites:
#  - terminal-notifier (brew install terminal-notifier)

# variables
maxcpu=30 
weight=0
maxweight=5
counter=0
prevwscpu=0

# main engine
while :; do
	wscpu=$(ps -A -o %cpu,comm | grep WindowServer | awk '{print int($1)}')
	if [ $wscpu -gt $maxcpu ]; then
		((weight++))
		# echo "$weight"
		if [ $weight -gt $maxweight ]; then
			((counter++))
			# delta 
			if [ $prevwscpu -gt $wscpu ]; then
				dicon='⬇'
			elif [ $prevwscpu -lt $wscpu ]; then
				dicon='⬆'
			else
				dicon='-'
			fi
			terminal-notifier \
				-group 'hu.fleischmann.macoswscpumonitor' \
				-title 'WindowServer high CPU usage!' \
				-subtitle 'Warning❗' \
				-message "CPU: $wscpu% $dicon, counter: $counter"
			#echo 'High CPU!'
			prevwscpu=$wscpu
		fi
	else
		# reset
		weight=0
		counter=0
	fi
	sleep 1
done