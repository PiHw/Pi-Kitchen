#!/bin/sh
recipe_path="/home/pi/recovery/pi-kitchen/007-network-share"
smb_deb_path=$recipe_path"/deb/"
smb_conf_file=$recipe_path"/etc/samba/smb.conf"

f_default(){
echo "Default: Install using local files"
f_local
}

#Install from locally
f_local(){
echo "Installing SMB from local files"
echo $smb_deb_path
cd $smb_deb_path
#Dependencies for samba are: tdb-tools samba-common libwbclient0
sudo dpkg -i libwbclient0*.deb
sudo dpkg -i tdb-tools*.deb
sudo dpkg -i samba-common*.deb
sudo dpkg -i samba_*.deb
}

#Install from network
f_network(){
echo "Install SMB from apt-get"
sudo apt-get update
sudo apt-get -y install samba
}

#Update install files from apt-get and install
f_update(){
echo "Update install files from apt-get then install locally"
echo $smb_deb_path
cd $smb_deb_path
for file in *.deb; do
  sudo mv "$file" "`basename $file .deb`.old"
done
sudo apt-get update
#Dependencies for samba are: tdb-tools samba-common libwbclient0
sudo apt-get download tdb-tools
sudo apt-get download samba-common
sudo apt-get download libwbclient0
sudo apt-get download samba
f_local
}

#Check for internet connection
ping www.raspberrypi.org -c 4

#Allow user to choose to install from network
echo ">>>How do you want to install network folders (SMB)?"
echo "[L] from local files (default)?"
echo "[N] Using apt-get via the network?"
echo "[U] Update the local files using apt-get and then install?"
echo "[S] Skip install, just reconfigure?"
echo "Installing from the network will fetch the latest version using apt-get"
echo "If the above ping command failed, you probably will not be able to install from the network"
echo ">>>"
read option
case $option in
L)  f_local;;
l)  f_local;;
N)  f_network;;
n)  f_network;;
U)  f_update;;
u)  f_update;;
S)  ;;
s)  ;;
*)  f_default;;
esac

sudo cp $smb_conf_file /etc/samba/smb.conf
sudo pdbedit -a -u pi
sudo /etc/init.d/samba restart

echo "SMB All done!"
