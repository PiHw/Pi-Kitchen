<img style="float:left" src="IMG_SCR/warn.png" height=40/>
<b>WARNING:</b> The following assumes that you have a working wired network (or a wireless adaptor which doesn't need additional drivers).

Check out the <a href="RC_GITHUBMD_URL/006-wifi-driver_RECIPE_CARD.md">Wifi driver recipe</a> if you need help identifying the wifi adaptor or want to install the drivers without a **working** network connection.

##Drivers##

###Installing the wifi drivers, using `install_wifi-devices.sh`###

The `install_wifi-devices.sh` script will allow the required wifi drivers to be installed during the first start up.  The `install_wifi-devices.sh` script should be placed in the `_RUNONCE` directory.

For each driver you want to install, where <packagename> is the driver listed from searching `apt-cache`:

`sudo apt-get install <packagename>`

e.g. For **firmware-ralink** add the following to `install_wifi-devices.sh`:

`sudo apt-get install firmware-ralink`

##Wifi Settings##
###The `interfaces` file###
This replaces the standard `etc\network\interfaces` file with one which uses `etc\wpa.conf` for the wifi settings.

    auto lo
    
    iface lo inet loopback
    iface eth0 inet dhcp
    
    iface default inet dhcp
    
    auto wlan0
    iface wlan0 inet dhcp
    
    wpa-conf /etc/wpa.conf


<img style="float:left" src="IMG_SCR/note.png" height=40/>
<b>NOTE:</b> Some devices will have different names to `wlan0` (i.e. `ra0`) so you may need to adjust this file.


###The `wpa.conf` file###
The `wpa.conf` file should detail the wifi settings as follows:


    network={
      ssid="firstnetwork"
      key_mgmt=WPA-PSK
      psk="passphrase1"
    }
    network={
      ssid="secondnetwork"
      key_mgmt=WPA-PSK
      psk="passphrase1"
    }



<img style="float:left" src="IMG_SCR/note.png" height=40/>
<b>NOTE:</b> We place this file in **_SETTINGS** so that it is easier to remove sensitive information from our configurations.
> 
> An example `wpa.conf` is provided in `pi-kitchen\005-wifi\etc` directory.

