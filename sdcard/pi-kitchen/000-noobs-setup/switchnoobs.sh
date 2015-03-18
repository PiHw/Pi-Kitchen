#!/bin/sh
# Switch recovery.cmdline for NOOBS install and setup for auto/gui installs
#
# Will perform the following steps (if cmdline isn't set):
# 1. Select NOOBS run mode (Normal/GUI/Auto/Keep)
# 2. Select video mode (for Normal, GUI and Auto only)
# [N/A yet] 3. Select distro (for Auto only)
# 4. Select flavour (for Auto only)
#
# switchnoobs.sh runmode videomode flavour distro
#
# We assume this script is located in ~/bin

selectRUNMODE()
{
   echo Select the required NOOBS Run Mode.
   echo (${RUNMODE_LIST[0]}) Starts OS normally - Press shift on boot to start NOOBS
   echo (${RUNMODE_LIST[1]}) Starts the NOOBS GUI on next power up
   echo (${RUNMODE_LIST[2]}) Automatically install the selected distribution and flavour
   echo (${RUNMODE_LIST[3]}) Keep current settings and exit
   echo
   # Menu using case-esac
   read answer
   if [ $answer -le 4 ]
   then
     echo "Selected: ${RUNMODE_LIST[$answer]}";RUNMODE=${RUNMODE_LIST[$answer]};
   fi
}



# ===== Check Command Line ======
# Read in the command line inputs:
# RUNMODE
if [ "$1" =  "" ]
then
  RUNMODE=ASK
else
  RUNMODE=$1
  echo Runmode: $RUNMODE
fi
# VIDEOMODE
if [ "$2" =  "" ]
then
  VIDEOMODE=ASK
else
  VIDEOMODE=$2
  echo Video Mode: $VIDEOMODE
fi
# FLAVOUR
if [ "$3" =  "" ]
then
  FLAVOUR=ASK
else
  FLAVOUR=$3
  echo Flavour: $FLAVOUR
fi
# DISTRO
if [ "$4" =  "" ]
then
  DISTRO=ASK
else
  DISTRO=$4
  echo Distro: $DISTRO
fi
# =============================

DISTRO=Raspbian
HOME="/home/pi"
DEST=$HOME"/recovery/recovery.cmdline"
DISTRO_PATH=$HOME"/recovery/os/Raspbian"
RUNMODE_LIST=(normal gui auto exit)
VIDEOMODE_LIST=(HDMI HDMIsafemode PAL NTSC Default)
DATA_PARTITION=TRUE

#========= 1. Handle NOOBS runmode =========
if [ "$RUNMODE" =  "ASK" ] (
  selectRUNMODE
)
echo $RUNMODE
#===========================================