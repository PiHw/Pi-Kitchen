#!/bin/sh
echo "Run installonce script"

#This will run all the sh files placed in the ~/bin/_INSTALLONCE directory
cd /home/pi/bin/_INSTALLONCE
list=`ls *.sh`
for script in $list
do
echo ">>> Running: $script"
sh "$script"
done

