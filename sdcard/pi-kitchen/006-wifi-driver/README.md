Most Wifi adaptors require additional drivers to be installed in order to work.  However, normally a working network connection is required to install drivers using `apt-get`.  If a wired network connection isn't available (or you have a model A Raspberry Pi) then it can be particularly difficult to install drivers on the operating system.

This recipe allows you to install the required drivers without connecting to the internet first.

##Drivers##
Many drivers are available from `apt-get` which we can use to download the driver package so we can install them at a later stage.

Some devices are not supported by the drivers available in the apt-get repository.  These can be installed manually, if you are able to find the appropriate files.

###Identifying your device###
To list details for USB devices which have been inserted:

`dmesg | grep "usb"`

To check if the adaptor has been detected and is already installed:

`ifconfig`

Get a list of drivers which are available via `apt-get` installer:

`sudo apt-cache search firmware`

List connected USB devices:

`lsusb`

To get information on any devices which have been connected to the USB ports, use:

`dmesg | grep -i usb`

You can then use the information (such as the **idVendor** and **idProduct** to search for suitable drivers).

Enable/disable wifi interface `wlan0` with:

`sudo ifup wlan0`

And:

`sudo ifdown wlan0`

##Example zyxtel-g202##
This will provide the drivers for ZyXel G-202 USB Wifi Dongle (`zd1211-firmware_2.21.0.0-1_all.deb`).

<img src="IMG_SRC/zyxtel-g202.png" height=300/>
Device details:

VID_0586 PID_3410 REV_4810

You can get the latest version of the package file using the following command:

`sudo apt-get -download zd1211-firmware`

The package file should be placed on the SD-Card:

`/pi-kitchen/006-wifi-driver/zyxtel-g202/`

The deb file is kept in this location and the runonce script `install_zyxel-g202.sh` should be copied into the `bin\_RUNONCE` location (which will automatically install it).

###Installing using `dpkg`###
The driver package can be installed using `dpkg`:

`sudo dpkg -i "zd1211-firmware_2.21.0.0-1_all.deb"`

##Example ralink-7601##
This will install the files required to use a USB RALink 7601 Wifi dongle.

<img src="IMG_SRC/ralink-7601.png" height=300/>
Device details:

VID_148F PID_7601

This requires two files to be placed in the following locations:

`/etc/Wireless/RT2870STA/RT2870STA.dat`

`/lib/modules/3.12.28+/kernel/drivers/net/wireless/mt7601Usta.ko`

<img style="float:left" src="IMG_SRC/note.png" height=40/>
<b>NOTE:</b> The `mt7601Usta.ko` file is dependent on the Kernel version, so the version of this file should match the Kernel version of the OS you plan to use it with.  Fortunately, you can copy all the available versions and the OS will only use the file in the appropriate folder.

I've collected a few versions which work with the most recent kernel versions (be sure to check the links below if they become out-dated).

You can find out the Kernel version with the following command:

`uname -a`


###Installing using modprobe###
The `install_ralink-7601.sh` will install the driver using modprobe:

`sudo modprobe -v mt7601Usta`

Run `sudo depmod -a` to apply immediately (may not be needed following a reboot).


By default this device will be called `ra0`.

###`70-persistent-net.rules`###
By placing this file in `etc/udev/rules.d` the `ra0` adaptor will be renamed to be `wlan0` (the same as other Wifi adaptors).

This is very helpful since there can be issues if you have multiple settings in the `interfaces` file for each adaptor.  This way, they are able share the settings.

###Driver details:###
Driver files and install information thanks to the following resources.

*I am very thankful for the effort put into compiling and sharing these drivers. MrEngman, James Foley, alfonder, Gowtham, Thomas Wenzlaff etc.*

[http://gowthamgowtham.blogspot.co.uk/2013/11/mediatekralink-wifi-adapter-in.html](http://gowthamgowtham.blogspot.co.uk/2013/11/mediatekralink-wifi-adapter-in.html)

[https://github.com/jamesfoley/raspberry-pi-MT7601](https://github.com/jamesfoley/raspberry-pi-MT7601)

[https://wiki.archlinux.org/index.php/kernel_modules](https://wiki.archlinux.org/index.php/kernel_modules)

[http://www.raspberrypi.org/forums/viewtopic.php?f=28&t=49864&start=100](http://www.raspberrypi.org/forums/viewtopic.php?f=28&t=49864&start=100)

Kernel 3.12.35+ support plus ra0 to wlan0 rename info:
[http://blog.wenzlaff.de/?p=4805](http://blog.wenzlaff.de/?p=4805)

##Wifi Settings##

###The `interfaces` file###
This is the same as the `etc/network/interfaces` file used  with **005-wifi recipe** which uses `etc/wpa.conf` for the Wifi settings.

###`wpa.conf`###

The recipe file can be set to use the `wpa.conf` files located in the `_SETTINGS` directory.

<img style="float:left" src="IMG_SRC/note.png" height=40/>
<b>NOTE:</b> We place this file in **_SETTINGS** so that it is easier to remove sensitive information from our configurations.

An example `wpa.conf` is provided in `pi-kitchen\005-wifi\etc` directory.
