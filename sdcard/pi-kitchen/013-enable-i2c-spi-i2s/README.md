#Install i2ctools#
i2c-tools
`sudo apt-get install i2c-tools`

Get package:
`sudo apt-get download i2c-tools`

Install package:
`sudo dpkg -i i2c-tools*.deb`

#Enable I2C Driver#
Add to `/boot/config.txt`:

`dtparam=i2c=on,i2s=on,spi=on`

Add to `/etc/modules`:

   i2c-dev
   i2c-bcm2708 #May not be needed
   
Normally we would add this on the first run (via _RUNONCE) however, it would be helpful to have it enabled on the first run too.  Therefore we may use external overlays to achieve what we want (which can be added/removed as required).

#Using External Overlays#
This method requires the following to be added to the `config.txt` file, which will attempt to load:

   dtoverlay=enable-i2c-arm
   dtoverlay=enable-i2s
   dtoverlay=enable-spi
   
**Note:** Since the **002-bootdisplay** recipe uses the `config.txt` to set the different display settings, these items should be added to each of the `config.txt` files used.  A standard HDMI `config.txt` file is also included in this recipe, in case you don't want to include the **002-bootdisplay** in your setup.

We can then add each of the required overlay files into the `/boot/overlays` folder:

   enable-i2c-arm-overlay.dtb
   enable-i2s-overlay.dtb
   enable-spi-overlay.dtb

If the overlay file isn't there, the driver is simply not loaded - so we can control what we add via our recipe or flavour file.
   
##Reference##
Thanks to PhilE for the information needed to implement the external overlay method:
http://www.raspberrypi.org/forums/viewtopic.php?f=28&t=97314&start=50#p703747

#Wire I2C Device#

2[=============]26[=======]40
1[VDC=X========]25[=======]39
V=VCC 3.3V
D=I2C Data
C=I2C Clock
X=Gnd

#Use I2C Detect#
`sudo i2cdetect -y 1`


     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- 68 -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
