#!/bin/sh
echo "Run runoncebg script"

#This will run all the sh files placed in the ~/bin/_RUNSTARTBG directory
cd /home/pi/bin/_RUNSTARTBG
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
sh "$script" &
done

#This will run all the sh files placed in the ~/recovery/_USER/_RUNSTARTBG directory
cd /home/pi/recovery/_USER/_RUNSTARTBG
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
sh "$script" &
done
