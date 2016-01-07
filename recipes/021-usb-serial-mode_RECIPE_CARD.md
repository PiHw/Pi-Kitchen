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
<h1>021 : USB Serial Mode</h1>
</font>

<table style="width:35%" align="right" >
  <tr>
    <th bgcolor=black><font color=white>Recipe Files</th>
    <th bgcolor=black><font color=white>Ingredients</th>
  </tr>
  <tr>
    <td>
              <i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/021-usb-serial-mode/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b><p>
            </td>		
    <td><i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/021-usb-serial-mode_INGREDIENTS.zip">021-usb-serial-mode_INGREDIENTS.zip</a></i></b></td>
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
#USB Device Mode - Serial#
The Raspberry Pi Model A and Raspberry Pi Zero have the ability to be setup as USB devices (since they are wired directly to the Broadcom processor).  This recipe sets up the Raspberry Pi as a Virtual USB Serial Device.

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
	`sudo cp -R /tmp/PiZeroCombined/ext4/lib/* /lib/`
5. Remove extracted files:
	`sudo rm /tmp/$modulefolder -Rf`
</pre>

##022-usb-lan-mode recipe##
1. Update the module (Add `g_serial` to `etc/modules`).
2. Enable logging in for the Serial Gadget (Run `sudo systemctl enable getty@ttyGSO.service`).  You can check this using `sudo systemctl is-active getty@ttyGSO.service`.

On restart the Raspberry Pi should be detected (by the connected computer) as a USB Serial device.  Connect using Putty (115200 Baud).
</font>

##How to use##
<font color = GREEN>
<p>
</font>

##Ingredients##
The ingredient files should be placed in the following location on the NOOBS RECOVERY partition:<p>

<font color = GREEN>
<code>pi-kitchen/021-usb-serial-mode</code><p>
</font>

This recipe uses the following files:<p>
<font color = GREEN>
_RUNONCE/install_usbserialdevicemodule.sh<p>etc/modules<p><p>
</font>


You can download all the <a href="https://github.com/PiHw/Pi-Kitchen/raw/master/recipes/021-usb-serial-mode_INGREDIENTS.zip">ingredient files</a>, and extracted directly to the NOOBS SD-Card (ensuring you remove the ZIP file's name from the directory - the files should be extracted to <code>pi-kitchen/021-usb-serial-mode</code>).<p>

##The Recipe Files##
Each recipe will use one file for each of the partitions it installs to - boot, root and data).<p>


You will need to suitably rename or copy the content of each of the following files into your recipe files (i.e. <code>RaspbianPiKitchen_root.txt</code>) and place them in your os folder in the NOOBS partition (i.e. <code>os/Raspbian</code>).<p>

For more information see the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours">Pi-Kitchen: Creating Flavours</a> guide.<p>


<i><b><a href="https://github.com/PiHw/Pi-Kitchen/raw/master/sdcard/pi-kitchen/021-usb-serial-mode/RECIPE_FILE_root.txt">(flavour)_root.txt</a></i></b>
<pre>
#
#Recipe: 021-usb-serial-mode
#- Add script to _RUNONCE folder
../../pi-kitchen/021-usb-serial-mode/_RUNONCE/install_usbserialdevicemodule.sh /home/pi/bin/_RUNONCE
#- Replace the /etc/modules file
../../pi-kitchen/021-usb-serial-mode/etc/modules /etc/</pre>



<hr>

Enjoy baking your Raspberry Pi SD-Card fresh from the Pi-Kitchen.<p>

<!--========================END FILE================-->
