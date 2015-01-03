#!/bin/sh

name="Scratch GPIO (v6)"
source_path="/home/pi/recovery/pi-kitchen/010-scratch-gpio/install/"
url="http://goo.gl/xzJlz7"
package="install_scratchgpio6.sh"

f_default(){
echo "Default: Install using local files"
f_local
}

#Install from locally
f_local(){
echo "Installing $name from local files"
echo $source_path
cd $source_path
#Install:
sudo bash $package
}

#Install from network
f_network(){
echo "Install $name from internet"
#Get file:
wget $url
#Install:
sudo bash $package
#Remove file:
rm $package
}

#Update install files from apt-get and install
f_update(){
echo "Update install files from internet then install locally"
echo $deb_path
cd $deb_path
sudo mv $package $package.old -f
#Get file:
wget $url
#Install locally:
f_local
}

#Check for internet connection
ping www.raspberrypi.org -c 4

#Allow user to choose to install from network
echo ">>>How do you want to install $name?"
echo "[L] from local files (default)?"
echo "[N] Using apt-get via the network?"
echo "[U] Update the local files using apt-get and then install?"
echo "[S] Skip install, just reconfigure?"
echo "Installing from the network will fetch the latest version using wget"
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


echo "$name All done!"
