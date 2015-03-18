#!/bin/bash
# This script should allow the display output to be changed automatically
# Will support extra parameters:
# off - display off
# on - display on
# test - test display off and on
# show - show details of current display
# 1-10 - select a particular display
# next - select the next display in the list
# cycle - will slowly cycle through all the display options
# pal - will switch to SDTV PAL
# ntsc - will switch to SDTV NTSC
TVPROG=/opt/vc/bin/tvservice
SETTING1='--explicit="DMT 35 HDMI"'
SETTING2='--sdtvon="PAL 4:3"'
SETTING3='--sdtvon="NTSC 4:3"'
WAIT_TIME=5

sleep $WAIT_TIME

if [ $1 = 'off' ]; then
  $TVPROG -o
  echo "Screen OFF"
fi

if [ $1 = 'on' ]; then
  $TVPROG $SETTING1
  fbset -depth 8
  echo "Screen ON - $SETTING1"
fi

if [ $1 = 'pal' ]; then
  $TVPROG $SETTING2
  fbset -depth 8
  echo "Screen ON - $SETTING2"
fi

if [ $1 = 'ntsc' ]; then
  $TVPROG $SETTING3
  fbset -depth 8
  echo "Screen ON - $SETTING3"
fi

if [ $1 = 'test' ]; then
  $TVPROG -o
  echo "Screen OFF"
  sleep $WAIT_TIME
  $TVPROG $SETTING1
  fbset -depth 8
  echo "Screen ON - $SETTING1"
fi

if [ $1 = 'next' ]; then
  $TVPROG -s
fi

if [ $1 = 'show' ]; then
  $TVPROG -s
fi

echo "Display Switcher run with $1"
