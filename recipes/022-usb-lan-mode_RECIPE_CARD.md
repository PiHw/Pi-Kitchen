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
<h1>022 : LAN Mode</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/022-usb-lan-mode/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/022-usb-lan-mode_INGREDIENTS.zip">022-usb-lan-mode_INGREDIENTS.zip</a></i></b></td>
  </tr>
    <tr>
    <td>
      <i><b>Tested: Raspbian</i></b>
    </td>
  </tr>
  </table>

<img style="float:left" src="https://raw.githubusercontent.com/PiHw/Pi-Kitchen/master/markdown_source/markdown/img/warn.png" height=40/>
<b>WARNING:</b> This recipe also requires the following recipe(s) to be setup on the SD-Card:<p>
<font color = GREEN>
<a href="https://github.com/PiHw/Pi-Kitchen/blob/master/recipes/020-usb-device-module">020-usb-device-module</a><p>
</font>

<br>


##Description##
<font color = GREEN>
#USB Device Mode - LAN#
The Raspberry Pi Model A and Raspberry Pi Zero have the ability to be setup as USB devices (since they are wired directly to the Broadcom processor).  This recipe sets up the Raspberry Pi as a Virtual USB LAN Device.

This recipe is based on the hard work of Andrew Mulholland (@gbaman1), DaveB (PiForums) and LadyAda (AdaFruit).

The Adafruit guide ([https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget?view=all](https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget?view=all "Raspberry Pi USB Device Mode")) explains the process.

More information is also available at:
[http://pi.gbaman.info/?p=699](http://pi.gbaman.info/?p=699 "RASPBERRY PI ZERO – PROGRAMMING OVER USB!")

Modules included:

- Serial (g_serial)
- Ethernet (g_ether)
- Mass storage (g_mass_storage)
- MIDI (g_midi)
- Audio (g_audio)
- Mass storage and Serial (g_acm_ms)
- Ethernet and Serial (g_cdc)
- Multi (g_multi) Allows you to configure 2 from Ethernet, Mass storage and Serial

##020-usb-device-module recipe##
The general process is as follows:

1. Get PiZeroCombined.tar.gz module (https://dl.dropboxusercontent.com/u/1122948/temp/PiOTGTest/
PiZeroCombined.tar.gz).
2. Uncompress the kernel module (`tar xvzfC $modulesource /tmp/`).
3. Copy boot partition files:
	`sudo cp -R /tmp/PiZeroCombined/fat32/* /boot/`
4. Copy module files to root partition:
	`sudo cp -R /tmp/PiZeroCombined/ext4/libboot/modules/lib/* /lib/`
5. Remove extracted files:
	`sudo rm /tmp/$modulefolder -Rf`
</pre>

##022-usb-lan-mode recipe##
1. Update the module (Add `g_ether` to `etc/modules`).
2. Add the following to `/etc/network/interfaces`:
3. <pre>allow-hotplug usb0
iface usb0 inet static
        address 192.168.42.2
        netmask 255.255.255.0
        network 192.168.42.0
        broadcast 192.168.42.255
        gateway 192.168.42.1</pre>

On restart the Raspberry Pi should be detected (by the connected computer) as a Ethernet device.

<img src="img/piusblanmode.png" width=250 />

On the host machine, setup the ethernet connection with the following manual settings:

- IP Address: 192.168.42.1
- Subnet Mask: 255.255.255.0
- Default Gateway: 192.168.42.1
- No DNS.

###Using network hostnames###
Alternatively (instead of putting a fixed IP) install **Bonjour** on Windows (already included on Apple Mac) which will allow us to use the Raspberry Pi hostname `raspberry.local`.

On Pi you may need (probably already installed):

`sudo apt-get install avahi-daemon`

For MAC support you may also need:

`sudo apt-get install netatalk`

On Windows either install iTunes (which includes it) or Bonjour Print Services for Windows 2.0.2 ([http://support.apple.com/kb/DL999](http://support.apple.com/kb/DL999 "Bonjour Print Services for Windows 2.0.2."))

###Sharing the host computer internet connection###
Connect the Raspberry Pi and 
On the host PC, enable ICS (Internet Connection Sharing), as follows:

On windows, this is achieved via the **Control Panel > Network and Internet > Network Connections** window.


- Right click on the network adaptor from which you normally connect to the internet (i.e. Wifi) and select **properties**.
- Enable **Internet Connection Sharing** on the **Sharing** tab.

<img src="img/ics_enable.png" width=250 />

- Select the Ethernet device **EthernetX** which matches the one listed as **USB Ethernet/RNDIS Gadget** in the device manager.
- Take note of the IP address suggested, but don't accept it yet (if it does not match the current IP of the Raspberry Pi)!  i.e. Suggested IP address: `192.168.137.1`

Connect to the Raspberry Pi via Putty using the previously configured IP address (192.168.42.2).

- You must set the Raspberry Pi's IP address to match the first three numbers, by editing `/etc/network/interfaces` (this version of the file is available `_SETTINGS/022-usb-lan-mode/internet` folder):

        address 192.168.137.2
        netmask 255.255.255.0
        network 192.168.137.0
        broadcast 192.168.137.255
        gateway 192.168.137.1
- Reboot the Raspberry Pi using `sudo reboot`
- Finally, enable ICS and accept the suggested IP address.
- You should now be able to connect using the newly set address for the Raspberry Pi 192.168.137.2 via Putty.

You may also need to ensure that the Ethernet device **EthernetX** (which matches the one listed as **USB Ethernet/RNDIS Gadget** in the device manager) has the following settings:

<img src="img/ics_settings.png" width=350 />

This ensures the USB Ethernet adaptor which has the ICS linked to it has the same IP address group as the Raspberry Pi's fixed address.</font>

##How to use##
<font color = GREEN>
<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/022-usb-lan-mode</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
etc/network/interfaces<p>etc/modules<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/022-usb-lan-mode_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/022-usb-lan-mode</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/022-usb-lan-mode/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 022-usb-lan-mode
#- Replace the /etc/modules file
../../pi-kitchen/022-usb-lan-mode/etc/modules /etc/
#- Replace the /etc/network/interfaces file
#Default (non-internet connection sharing setting)
../../pi-kitchen/022-usb-lan-mode/etc/network/interfaces /etc/network
#Internet Connection Sharing settings (ensure this is suitable for your setup if ICS required)
../../pi-kitchen/_SETTINGS/022-usb-lan-mode/internet/interfaces /etc/network
</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
