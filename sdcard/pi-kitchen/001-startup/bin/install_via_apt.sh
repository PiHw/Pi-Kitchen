#!/bin/sh
# The command line inputs determines:
# RECIPE selected
# NAME to display
# PACKAGE to install from apt-get
# DEFAULT action
# i.e. install_via_apt 013-enable-i2c-spi I2C Tools i2c-tools local
#
# Read in the command line inputs:
# RECIPE
if ["$1" =  ""]
then
  RECIPE=NONE
else
  RECIPE=$1
fi

# NAME
if ["$2" =  ""]
then
  NAME=NONE
else
  NAME=$2
fi

# PACKAGE
if ["$3" =  ""]
then
  PACKAGE=NONE
else
  PACKAGE=$3
fi

# DEFAULT
if ["$4" =  ""]
then
  PACKAGE=NONE
else
  PACKAGE=$4
fi

echo $RECIPE installing $NAME (using package: $PACKAGE)
name=$NAME
recipe_path="/home/pi/recovery/pi-kitchen/$RECIPE"
deb_path=$recipe_path"/deb/"
package=$PACKAGE



f_default(){
echo "Default: Install using local files"
f_local
}

#Install from locally
f_local(){
echo "Installing $name from local files"
echo $deb_path
cd $deb_path
#Dependencies are:
installpgk=$package"*.deb"
sudo dpkg -i $installpgk
}

#Install from network
f_network(){
echo "Install $name from apt-get"
sudo apt-get update
sudo apt-get -y install $package
}

#Update install files from apt-get and install
f_update(){
echo "Update install files from apt-get then install locally"
echo $deb_path
sudo mkdir $deb_path
cd $deb_path
for file in *.deb; do
  sudo mv "$file" "`basename $file .deb`.old"
done
sudo apt-get update

#Dependencies are:
sudo apt-get download $package
f_local
}

#Check for internet connection
ping www.raspberrypi.org -c 4

if [ "$DEFAULT" = "NONE" ]
then
   #Allow user to choose to install from network
   echo ">>>How do you want to install $name?"
   echo "[L] from local files (default)?"
   echo "[N] Using apt-get via the network?"
   echo "[U] Update the local files using apt-get and then install?"
   echo "[S] Skip install, just reconfigure?"
   echo "Installing from the network will fetch the latest version using apt-get"
   echo "If the above ping command failed, you probably will not be able to install from the network"
   echo ">>>"

   read option
   case $option in
    L) f_local;;
    l) f_local;;
    N) f_network;;
    n) f_network;;
    U) f_update;;
    u) f_update;;
    S) ;;
    s) ;;
    *) f_default;;
   esac
elif [ "$DEFAULT" = "local" ]
then
   f_local;
elif [ "$DEFAULT" = "update" ]
then
   f_update;
elif [ "$DEFAULT" = "network" ]
then
   f_network;
fi


echo "$name All done!"

