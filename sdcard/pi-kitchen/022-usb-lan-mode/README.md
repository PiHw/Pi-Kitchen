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
        address 169.254.64.64
        netmask 255.255.255.0
        network 169.254.64.0
        broadcast 169.254.64.255
        gateway 169.254.64.1</pre>

On restart the Raspberry Pi should be detected (by the connected computer) as a Ethernet device.

<img src="img/piusblanmode.png" width=250 />

On the host machine, ensure the ethernet connection is set to **auto**.  Alternatively setup the ethernet connection with the following manual settings:

- IP Address: 169.254.64.1
- Subnet Mask: 255.255.255.0
- Default Gateway: 169.254.64.1
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

Connect to the Raspberry Pi via Putty using the previously configured IP address (169.254.64.64).

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

This ensures the USB Ethernet adaptor which has the ICS linked to it has the same IP address group as the Raspberry Pi's fixed address.