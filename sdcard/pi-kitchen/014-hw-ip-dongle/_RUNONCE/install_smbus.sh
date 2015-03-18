#!/bin/sh

name="Python2 SMBus"
recipe_path="/home/pi/recovery/pi-kitchen/014-hw-ip-dongle"
deb_path=$recipe_path"/deb/"
package="python-smbus"

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
cd $deb_path
for file in *.deb; do
  sudo mv "$file" "`basename $file .deb`.old"
done
sudo apt-get update

#Dependencies are:
sudo apt-get download $package
f_local
}

###Check for internet connection
##ping www.raspberrypi.org -c 4

###Allow user to choose to install from network
##echo ">>>How do you want to install $name?"
##echo "[L] from local files (default)?"
##echo "[N] Using apt-get via the network?"
##echo "[U] Update the local files using apt-get and then install?"
##echo "[S] Skip install, just reconfigure?"
##echo "Installing from the network will fetch the latest version using apt-get"
##echo "If the above ping command failed, you probably will not be able to install from the network"
##echo ">>>"

##read option
##case $option in
## L) f_local;;
## l) f_local;;
## N) f_network;;
## n) f_network;;
## U) f_update;;
## u) f_update;;
## S) ;;
## s) ;;
## *) f_default;;
##esac

#Install smbus from local file since we may not have network at this point (and we can inform the user via the IP Dongle)
f_local

echo "$name All done!"
echo "=================="
echo "To update smbus, run:"
echo "sudo apt-get update"
echo "sudo apt-get install smbus"
echo "To get an updated .deb file, use:"
echo "sudo apt-get download smbus"
echo "Copy the file to $deb_path"
