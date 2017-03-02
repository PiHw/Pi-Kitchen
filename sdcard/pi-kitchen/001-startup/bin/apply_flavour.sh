#!/bin/sh
echo "Apply a new flavour to the current setup"
echo "- This may differ to a clean installation"

#Either define flavour from the commmand line, or select from the list
FLAVOUR="$1"
echo "Apply Flavour: ${FLAVOUR}"

#Make sure you are root
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

#Assume the recovery partition has been mounted /home/pi/recovery
cd /home/pi/recovery
./retro.sh /home/pi/recovery/os/Raspbian /boot/ ${FLAVOUR}_boot
./retro.sh /home/pi/recovery/os/Raspbian / ${FLAVOUR}_root

echo "Done!"
