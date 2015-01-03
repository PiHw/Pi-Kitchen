<!-- How to use comments in these files -->
<!-- ---------------------------------- -->
<!--Comments have been put in this file so that they can be automatically generated.

[How to customise the Markdown documents](CustomMarkdown.md)-->
<!--Template 03/01/2015-->

















<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/pihwlogotm.png" width=180 />
<hr>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/PiKitchenRecipe.png" width=180 />
#Recipe Card#

<font color = GREEN>
<h1>006 : Wifi Driver Configuration</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/006-wifi-driver/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/006-wifi-driver_INGREDIENTS.zip">006-wifi-driver_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Raspbian</i></b>
    </td>
  </tr>
  </table>


See the markdown version of this recipe on the <a href="https://github.com/PiHw/Pi-Kitchen">Pi-Kitchen GitHub</a> site see:
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/006-wifi-driver_RECIPE_CARD.md">006-Wifi Driver Configuration.md</a>

<br>


##Description##
<font color = GREEN>
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

<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/zyxtel-g202.png" height=300/>
Device details:

VID_0586 PID_3410 REV_4810

You can get the latest version of the package file using the following command:

`sudo apt-get -download zd1211-firmware`

The package file should be placed on the SD-Card:

`/pi-kitchen/006-wifi-driver/zyxtel-g202/`

The deb file is kept in this location and the runonce script `install_zyxel-g202.sh` should be copied into the `bin_RUNONCE` location (which will automatically install it).

###Installing using `dpkg`###
The driver package can be installed using `dpkg`:

`sudo dpkg -i "zd1211-firmware_2.21.0.0-1_all.deb"`

##Example ralink-7601##
This will install the files required to use a USB RALink 7601 Wifi dongle.

<img src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/ralink-7601.png" height=300/>
Device details:

VID_148F PID_7601

This requires two files to be placed in the following locations:

`/etc/Wireless/RT2870STA/RT2870STA.dat`

`/lib/modules/3.12.28+/kernel/drivers/net/wireless/mt7601Usta.ko`

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
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

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> We place this file in **_SETTINGS** so that it is easier to remove sensitive information from our configurations.

An example `wpa.conf` is provided in `pi-kitchen005-wifietc` directory.
</font>

##How to use##
<font color = GREEN>
1.Identify your Wifi adaptor.<p>2.Obtain the device package and create a script to install it or use the scripts for `ralink-7601` and `zyxtel-g202`.<p>3.Insert your Wifi settings into the `wpa.conf` file.<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/006-wifi-driver</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
etc/network/interfaces<p>_RUNONCE/install_zyxel-g202.sh<p>_RUNONCE/install_ralink-7601.sh<p>ralink-7601/3.10.25/mt7601Usta.ko<p>ralink-7601/3.12.22/mt7601Usta.ko<p>ralink-7601/3.6.11/mt7601Usta.ko<p>ralink-7601/RT2870STA.dat<p><p>
</font>

<b>Plus the following files in the _SETTINGS folder:</b><p>

It is assumed that the following file(s) are placed in the following location on the NOOBS RECOVERY partition:<p>
<font color = GREEN>
<code>pi-kitchen/_SETTINGS/005-wifi</code><p>
</font>

You will need the following _SETTINGS file(s):<p>

<font color = GREEN>
005-wifi/wifi_example/wpa.conf<p><p>
</font>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/note.png" height=40/>
<b>NOTE:</b> Files which are configured manually or may contain sensitive information are placed in the _SETTTINGS directory on the SD-Card.  This is so that it is easier to support different configurations and remove sensitive information from the setup if needed.<p>

Perform the following actions:<p>
<font color = GREEN>
Ensure you update wpa.config with your own Wifi SSID and pass-phrase.<p>
</font>

You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/006-wifi-driver_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/006-wifi-driver</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/006-wifi-driver/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 006-wifi-driver
#Setup Wifi Driver Configuration
../../pi-kitchen/006-wifi-driver/etc/network/interfaces /etc/network
#../../pi-kitchen/_SETTINGS/005-wifi/wifi_example/wpa.conf /etc
../../pi-kitchen/_SETTINGS/005-wifi/wifi_home/wpa.conf /etc
#-Add driver for ZyXel G202 USB Wifi Adaptor
../../pi-kitchen/006-wifi-driver/_RUNONCE/install_zyxel-g202.sh /home/pi/bin/_RUNONCE
#-Add driver for Realtek RALink 7601 USB Wifi Adaptor
../../pi-kitchen/006-wifi-driver/ralink-7601/3.6.11/mt7601Usta.ko "/lib/modules/3.6.11+/kernel/drivers/net/wireless" 644
../../pi-kitchen/006-wifi-driver/ralink-7601/3.10.25/mt7601Usta.ko "/lib/modules/3.10.25+/kernel/drivers/net/wireless" 644
../../pi-kitchen/006-wifi-driver/ralink-7601/3.12.22/mt7601Usta.ko "/lib/modules/3.12.22+/kernel/drivers/net/wireless" 644
../../pi-kitchen/006-wifi-driver/ralink-7601/3.12.28/mt7601Usta.ko "/lib/modules/3.12.28+/kernel/drivers/net/wireless" 644
../../pi-kitchen/006-wifi-driver/ralink-7601/3.12.35/mt7601Usta.ko "/lib/modules/3.12.35+/kernel/drivers/net/wireless" 644
../../pi-kitchen/006-wifi-driver/ralink-7601/RT2870STA.dat /etc/Wireless/RT2870STA 644
../../pi-kitchen/006-wifi-driver/etc/udev/rules.d/70-persistent-net.rules /etc/udev/rules.d
../../pi-kitchen/006-wifi-driver/_RUNONCE/install_ralink-7601.sh /home/pi/bin/_RUNONCE</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
