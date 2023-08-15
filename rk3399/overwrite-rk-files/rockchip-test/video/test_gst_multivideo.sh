#!/bin/bash

URI=/oem/SampleVideo_1280x720_5mb.mp4

export mpp_syslog_perror=1

if [ "$1" != "" ]
then
    URI=$1
    if [ "${URI:0:1}" != "/" ]
    then
        URI=$(readlink -f $URI)
    fi
fi

if [ "${URI:0:1}" == "/" ]
then
    URI=file://$URI
fi

if [ $(nproc) -le 4 ]; then
	while [ true ]
	do
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<0,180,540,360>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<540,180,540,360>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<0,540,540,360>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<540,540,540,360>" &
		wait
	done
else
	while [ true ]
	do
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<0,180,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<360,180,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<720,180,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<0,420,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<360,420,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<720,420,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<0,660,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<360,660,360,240>" &
		GST_DEBUG=fps*:5 gst-launch-1.0 uridecodebin uri=$URI ! waylandsink render-rectangle="<720,660,360,240>" &
		wait
	done
fi

