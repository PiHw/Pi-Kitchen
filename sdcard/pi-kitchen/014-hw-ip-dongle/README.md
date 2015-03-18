#HW IP Display Dongle#

This recipe is intended to support the <a href="http://4tronix.co.uk/store/index.php?rt=product/product&keyword=ip&product_id=377">4tronix IP dongle</a>:
<img src="http://4tronix.co.uk/store/resources/image/18/a5/b.jpg"/>

IPDisp uses an I2C Port expander chip, the MCP23017, to drive each of the 7-segment digits and display the current IP address of the Raspberry Pi.

However, this is just an example, as any other 7-segment display (or even an alpha-numeric display) could be used.  Also, we don't have to display just the IP address, you can adjust the script to display anything you want!

##Installation##
The I2C needs to be enabled on the Raspberry Pi, this can be achieved by including the 013-enable-i2c-spi-i2s recipe.

The `i2c-tools` can be used to test if the dongle is attached and the I2C is setup correctly.  With the dongle attached, run the following:

  sudo i2c-detect -y 0
  sudo i2c-detect -y 1

Depending on your Raspberry Pi model you should see the device listed on address 0x20 on one of the I2C buses (newer Pi's will use bus 1).

###smbus###
The current `ipd03.py` script uses **python 2** and `smbus` (to access the I2C bus).  The `smbus-python` package is not installed by default.  This recipe will install it using the `_RUNONCE` folder which will run the following command (or similar if installing using a local copy of the `.deb` file).

  sudo apt-get install smbus-python

To get updated `.deb` file use:

  sudo apt-get update
  sudo apt-get download smbus-python
  
For more information on the IP Display Dongle and the source file used for this recipe, see <a href="http://www.4tronix.co.uk/ipd/"> 4tronix's blog</a>.

