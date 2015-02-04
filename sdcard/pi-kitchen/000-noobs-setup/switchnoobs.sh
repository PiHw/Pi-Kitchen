#!/bin/sh
# Switch recovery.cmdline for NOOBS install and setup for auto/gui installs
# We assume this script is located in ~/bin
HOME="/home/pi"
DEST=$HOME"/recovery/recovery.cmdline"
DISTRO=$HOME"/recovery/os/Raspbian"
RECIPEPATH=$HOME"/recovery/pi-kitchen/000-noobs-setup"
FLAVOURPATH=$RECIPEPATH"/_flavours"
FLAVOUR=PiKitchen
OSPATH=$HOME"/recovery/os"

datapart(){
# Replace partitions.json file
sudo cp $FLAVOURPATH/partitions.json $DISTRO
# Add data.tar.xz (if not present)
#-n no overwrite
sudo cp -n $FLAVOURPATH/data.tar.xz $DISTRO
}

cmdline(){
# Replace the recovery.cmdline file
sudo cp $SOURCE $DEST
# If PNG files don't exist then copy (i.e. Provide icons for clean NOOBS setup)
#-n no overwrite
sudo cp -n $FLAVOURPATH/*.png $DISTRO
datapart
}

auto(){
# Change other files here for automatic install
#
# NOTE:
# Until recovery.cmdline file supports specifying an OS/Flavour from the cmdline.txt
# we have to adjust the setup so only one option is available.

# - Replace flavours.json with single flavour version
gen_flavours.sh $FLAVOUR
#sudo cp $FLAVOURPATH/$FLAVOUR $DISTRO/flavours.json

# - Rename os.json files in other os directories
find $OSPATH -name "os.json" -exec sudo rename "s/\.json$/\.disabled/i" {} \;
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
#FLAVOUR="flavours.json.normal"
#sudo cp $FLAVOURPATH/$FLAVOUR $DISTRO/flavours.json
FLAVOUR=ALL
gen_flavours.sh $FLAVOUR

# - Restore os.json files in all os directories
find $OSPATH -name "os.disabled" -exec sudo rename "s/\.disabled$/\.json/i" {} \;
cmdline
}

autohdmi(){
SOURCE="$RECIPEPATH/auto/recovery.cmdline"
FLAVOUR=PiKitchen
auto
}

autohdmidev() {
SOURCE="$RECIPEPATH/auto/recovery.cmdline"
#FLAVOUR="$RECIPEPATH/_flavours/flavours.json.autodev"
FLAVOUR=PiKitchenDev
auto
}

autosdtv() {
SOURCE="$RECIPEPATH/auto-sdtv/recovery.cmdline"
FLAVOUR=PiKitchen
auto
}

autosdtvdev() {
SOURCE="$RECIPEPATH/auto-sdtv/recovery.cmdline"
#FLAVOUR="$RECIPEPATH/_flavours/flavours.json.autodev"
FLAVOUR=PiKitchenDev
auto
}

guihdmi() {
SOURCE="$RECIPEPATH/install/recovery.cmdline"
gui
}

guisdtv() {
SOURCE="$RECIPEPATH/install-sdtv/recovery.cmdline"
gui
}

normal() {
SOURCE="$RECIPEPATH/normal/recovery.cmdline"
gui
}


echo "Set NOOBS to run on next startup with one of the following options:"
echo "1	Normal - Press shift on boot"
echo "2	Automated Install [HDMI + PiKitchen]"
echo "3	Automated Install [HDMI + PiKitchenDev]"
echo "4	Automated Install [PAL + PiKitchen]"
echo "5	Automated Install [PAL + PiKitchenDev]"
echo "6	Run GUI [HDMI]"
echo "7	Run GUI [PAL]"
echo "0	Keep Setting"

# Menu using case-esac
echo "[1/2/3/4/5/6/7/0]?"
read answer
case $answer in
 1) echo "Use Normal";normal;;
 2) echo "Use Automated Install [HDMI + PiKitchen]";autohdmi;;
 3) echo "Use Automated Install [HDMI + PiKitchenDev]";autohdmidev;;
 4) echo "Use Automated Install [PAL + PiKitchen]";autosdtv;;
 5) echo "Use Automated Install [PAL + PiKitchenDev]";autosdtvdev;;
 6) echo "Use Run GUI [HDMI]";guihdmi;;
 7) echo "Use Run GUI [HDMI]";guisdtv;;
 *) echo "Keep Setting - No Change";;
esac


echo "recovery.cmdline is:"
echo "___________________"
cat $DEST
