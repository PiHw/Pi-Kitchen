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
