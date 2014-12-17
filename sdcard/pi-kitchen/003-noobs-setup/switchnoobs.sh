#!/bin/sh
# Switch recovery.cmdline for NOOBS install and setup for auto/gui installs
# We assume this script is located in ~/bin
DEST="~/recovery/recovery.cmdline"
DISTRO="~/recovery/os/Raspbian"
FLAVOURPATH="~/recovery/pi-kitchen/003-noobs-setup/_flavours"
FLAVOUR="flavours.json.auto"

cmdline(){
# Replace the recovery.cmdline file
sudo cp $SOURCE $DEST
# If PNG files don't exist then copy (i.e. Provide icons for clean NOOBS setup)
#-n no overwrite
sudo cp -n $FLAVOURPATH/*.png $DISTRO/*.png
}

auto(){
# Change other files here for automatic install
# 
# NOTE:
# Until recovery.cmdline file supports specifying an OS/Flavour from the cmdline.txt
# we have to adjust the setup so only one option is available.

# - Replace flavours.json with single flavour version
sudo cp $FLAVOURPATH/$FLAVOUR $DISTRO/flavours.json

# - Rename os.json files in other os directories
find "~/recovery/os/" -name "os.json" -exec sudo rename 's/\.json$/\.disabled/i' {} \;
# Re-enable the selected distro
sudo mv $DISTRO/os.disabled $DISTRO/os.json
cmdline
}

gui(){
# Change other files here for GUI install
# 
# NOTE:
# Until cmdline.txt file supports specifying an OS/Flavour from the cmdline.txt
# we have to undo any changes made by the automatic installation option.

# - Replace flavours.json with multi flavour version
FLAVOUR="flavours.json.normal"
sudo cp $FLAVOURPATH/$FLAVOUR $DISTRO/flavours.json
# - Restore os.json files in all os directories
find "~/recovery/os/" -name "os.disabled" -exec sudo rename 's/\.disabled$/\.json/i' {} \;
cmdline
}

auto-hdmi() {
SOURCE=".\auto\recovery.cmdline"
auto
}

auto-hdmi-dev() {
SOURCE=".\auto\recovery.cmdline"
FLAVOUR=".\_flavours\flavours.json.autodev"
auto
}

auto-sdtv() {
SOURCE=".\auto-sdtv\recovery.cmdline"
auto
}

auto-sdtv-dev() {
SOURCE=".\auto-sdtv\recovery.cmdline"
FLAVOUR=".\_flavours\flavours.json.autodev"
auto
}

gui-hdmi() {
SOURCE=".\install\recovery.cmdline"
gui
}

gui-sdtv() {
SOURCE=".\install-sdtv\recovery.cmdline"
gui
}

normal() {
SOURCE=".\normal\recovery.cmdline"
gui
}


echo "Set NOOBS to run on next startup with one of the following options:"
echo "1	Normal - Press shift on boot"
echo "2	Automated Install (HDMI + PiKitchen)"
echo "3	Automated Install (HDMI + PiKitchenDev)"
echo "4	Automated Install (PAL + PiKitchen)"
echo "5	Automated Install (PAL + PiKitchenDev)"
echo "6	Run GUI (HDMI)"
echo "7	Run GUI (PAL)"
echo "0	Keep Setting"

# Menu using case-esac
echo "[1/2/3/4/5/6/7/0]?"
read answer
case $answer in
 1) echo "Use Normal";normal;;
 2) echo "Use Automated Install (HDMI + PiKitchen)";auto-hdmi;;
 3) echo "Use Automated Install (HDMI + PiKitchenDev)";auto-hdmi-dev;;
 4) echo "Use Automated Install (PAL + PiKitchen)";auto-sdtv;;
 5) echo "Use Automated Install (PAL + PiKitchenDev)";auto-sdtv-dev;;
 6) echo "Use Run GUI (HDMI)";gui-hdmi;;
 7) echo "Use Run GUI (HDMI)";gui-sdtv;;
 *) echo "Keep Setting - No Change";;
esac


echo recovery.cmdline is:
echo ___________________
cat $DEST
