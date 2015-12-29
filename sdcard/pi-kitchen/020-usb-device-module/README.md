#USB Device Mode - LAN#
The Raspberry Pi Model A and Raspberry Pi Zero have the ability to be setup as USB devices (since they are wired directly to the Broadcom processor).  This recipe provides the kernel modifications for these USB Modes.

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

Then use one of the following recipes to enable a specific mode:

- 021-usb-serial-mode recipe
- 022-usb-lan-mode recipe
