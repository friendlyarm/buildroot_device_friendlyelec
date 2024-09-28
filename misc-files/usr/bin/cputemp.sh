#!/bin/bash

while true
do
    echo "-----------------"
    for path in /sys/devices/system/cpu/cpu*/cpufreq; do
        CPU="$(echo $path | awk -F'/' '{print $6}')"
        printf "${CPU}: %s\n" "$(cat ${path}/cpuinfo_cur_freq)"
    done
    echo "Temp: `cat /sys/class/thermal/thermal_zone0/temp` °C"
    if [ -d /sys/devices/platform/pwm-fan ]; then
        CUR=`cat /sys/devices/virtual/thermal/cooling_device0/cur_state`
        MAX=`cat /sys/devices/virtual/thermal/cooling_device0/max_state`
        echo "Fan Level: ${CUR}/${MAX}"
    fi
    sleep 5
done
