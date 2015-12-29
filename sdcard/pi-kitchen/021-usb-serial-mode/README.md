#USB Device Mode - LAN#
The Raspberry Pi Model A and Raspberry Pi Zero have the ability to be setup as USB devices (since they are wired directly to the Broadcom processor).  This recipe sets up the Raspberry Pi as a Virtual USB LAN Device.

This recipe is based on the hard work of Andrew Mulholland (@gbaman1), DaveB (PiForums) and LadyAda (AdaFruit).

The Adafruit guide ([https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget?view=all](https://learn.adafruit.com/turning-your-raspberry-pi-zero-into-a-usb-gadget?view=all "Raspberry Pi USB Device Mode")) explains the process.

More information is also available at:
[http://pi.gbaman.info/?p=699](http://pi.gbaman.info/?p=699 "RASPBERRY PI ZERO – PROGRAMMING OVER USB!")

##020-usb-device-module recipe##
The general process is as follows:

1. Get gadgetkernel.tgz module (http://adafruit-download.s3.amazonaws.com/gadgetmodulekernel_151226a.tgz).
2. Uncompress the kernel module (`tar -xvzf gadgetkernel.tgz`).
3. Backup the current kernel.img (`sudo mv /boot/kernel.img /boot/kernelbackup.img`)
4. Replace the boot `kernel.img` (`sudo mv tmp/boot/kernel.img /boot`).
5. Install Overlays and Modules.<pre>
sudo mv tmp/boot/overlays/* /boot/overlays
sudo mv tmp/boot/*dtb /boot
sudo cp -R tmp/boot/modules/lib/* /lib
</pre>

##021-usb-serial-mode recipe##
1. Update the module (Add `g_ether` to `etc/modules`).
2. Add the following to `etc/network/interfaces:<pre>allow-hotplug usb0
iface usb0 inet static
        address 192.168.42.2
        netmask 255.255.255.0
        network 192.168.42.0
        broadcast 192.168.42.255
        gateway 192.168.42.1</pre>

On restart the Raspberry Pi should be detected (by the connected computer) as a Ethernet device.

On the host machine, setup the ethernet connection with the following manual settings:

- IP Address: 192.168.42.1
- Subnet Mask: 255.255.255.0
- Default Gateway: 192.168.42.1
- No DNS.

Alternatively (instead of putting a fixed IP) install **Bonjour** on Windows (already included on Apple Mac) which will allow us to use the Raspberry Pi hostname `raspberry.local`.

On Pi you may need:

`sudo apt-get install avahi-daemon`

For MAC support you may also need:

`sudo apt-get install netatalk`

On Windows either install iTunes (which includes it) or Bonjour Print Services for Windows 2.0.2 ([http://support.apple.com/kb/DL999](http://support.apple.com/kb/DL999 "Bonjour Print Services for Windows 2.0.2."))