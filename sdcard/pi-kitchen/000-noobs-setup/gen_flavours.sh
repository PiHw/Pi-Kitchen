#!/bin/sh
# This script will generate the flavours.json file for NOOBS.
# If performing an automated install, only a single flavour should be listed.
#
# The command line inputs determines the FLAVOUR selected for automated install and and DISTRO (or to use defaults given in this file).
# i.e. gen_flavours ALL Raspbian
#
# Read in the command line inputs:
# FLAVOUR
if ["$1" =  ""]
then
  FLAVOUR=ALL
else
  FLAVOUR=$1
fi
echo Flavour: $FLAVOUR

# DISTRO
if ["$2" =  ""]
then
  DISTRO=Raspbian
else
  DISTRO=$2
fi
echo Distribution: $DISTRO

DISTRO_PATH=../../os/$DISTRO
FLAVOUR_FILE=flavours.json
FLAVOUR_SOURCE=_flavours/*.json

AddFlavour() {
echo Add Flavour: $1
more "./_flavours/$1.json" >> $DISTRO_PATH/$FLAVOUR_FILE
echo >> $DISTRO_PATH/$FLAVOUR_FILE
}


# Add start of flavours.json file:
echo {> $DISTRO_PATH/$FLAVOUR_FILE
echo   "flavours": [>> $DISTRO_PATH/$FLAVOUR_FILE
echo "    {">> $DISTRO_PATH/$FLAVOUR_FILE
# Add required flavour(s):
if [ "$FLAVOUR" = "ALL" ]
then
   list=`ls $FLAVOUR_SOURCE`
   for F in $list
   do
      #Get flavour name from path/filename.json
      y=${F%.*}
      ADDFLAVOUR=${y##*/}
      AddFlavour $ADDFLAVOUR
      echo "     },">> $DISTRO_PATH/$FLAVOUR_FILE
      echo "    {">> $DISTRO_PATH/$FLAVOUR_FILE

   done
   # Remove the last two lines so the json entry can be closed
   sed '$d' $DISTRO_PATH/$FLAVOUR_FILE > temp.txt
   sed '$d' temp.txt > $DISTRO_PATH/$FLAVOUR_FILE
   rm temp.txt
else
   ADDFLAVOUR=$FLAVOUR
   AddFlavour $ADDFLAVOUR
fi
# Add end of flavours.json file:
echo "    }">> $DISTRO_PATH/$FLAVOUR_FILE
echo "  ]">> $DISTRO_PATH/$FLAVOUR_FILE
echo "}">> $DISTRO_PATH/$FLAVOUR_FILE


