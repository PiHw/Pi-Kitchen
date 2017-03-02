#IR Remote control#

This recipe allows the Raspberry Pi to be control by adding a low cost IR Receiver (e.g. TSOP38238) to the GPIO pins.

You will need to connect the IR module as follows:
<pre>
Raspberry Pi GPIO		TSOP38238 Pins
BCM GPIO24	(Pin18)	=	OUT
GND		(Pin20)	=	GND
3V3		(Pin17) =	VCC
</pre>
Where OUT, GND and VCC are the order of the pins (left-middle-right) when the IR Receiver is facing upwards.

<img src="img/ir_tsop38238.png" width=250 />

The module is fitted directly onto the Raspberry Pi as follows:
<pre>
BCM	PIN	PIN	BCM
3V3	17	18	GPIO24
N/C	19	20	GND
</pre>

The BCM GPIO input is set in the `/boot/config.txt` file using the following line:

	dtoverlay=lirc-rpi,gpio_in_pin=24

##Testing the IR##
Use `mode2 -d /dev/lirc0` and press some buttons on your remote-control.

You will see output like the following:
<pre>space 16300
pulse 95
space 28794
pulse 80
space 19395
pulse 83
space 402351
pulse 135
space 7085
pulse 85
space 2903</pre>

##Configuration files:##
LIRC uses the following configuration files to manage your setup (stored in `/etc/lirc/`).

###Valid Key Names###
To list the valid key names use the following command:

	irrecord --list-namespace

###hardware.conf###
Ensures LIRC knows our IR sensor is installed on `/dev/lirc0`.

###lircd.conf###
Remote control configuration file containing specific recorded signals for your own remote.  In order to use your own remote you will need to replace this file with your own.

Generate a new file use the following commands:

	sudo /etc/init.d/lirc stop
	irrecord -d /dev/lirc0 ~/lircd.conf
	sudo cp ~/lircd.conf /etc/lirc/lircd.conf

Which produces a file describing the IR protocol used by the remote control and allows you to map specific remote buttons to key names.

	KEY_UP	0x7A85

###lircmd.conf###


###lircrc###
This file maps the key names to commands, keyboard buttons or 

        prog=remote
        button=KEY_OK
        config=OK

Test the configuration with the following:

	ircat irexec

##Required Packages##
LIRC requires the following packages: 
<pre>
lirc
libftdi1
liblircclient0
</pre>

##More information##
See this [guide](http://alexba.in/blog/2013/01/06/setting-up-lirc-on-the-raspberrypi/) by Alex Bain which provides additional information and background for using IR devices with the Raspberry Pi.

[LIRC Website](http://www.lirc.org/)

For more details about the IR Receiver see the [TSOP38238 datasheet](http://www.vishay.com/docs/82491/tsop382.pdf)