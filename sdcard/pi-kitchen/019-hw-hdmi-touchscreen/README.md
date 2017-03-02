#HDMI Touchscreen Display#

This recipe allows the Raspberry Pi to be used with a custom HDMI display along with touch-screen.

The recipe has been developed for the following device:


- [5 Inch 800 x 480 HDMI TFT LCD Touch Screen For Raspberry PI](http://www.banggood.com/5-Inch-800-x-480-HDMI-TFT-LCD-Touch-Screen-For-Raspberry-PI-2-Model-B-B-A-B-p-1023438.html "5 Inch 800 x 480 HDMI TFT LCD Touch Screen For Raspberry PI")

Other screens appear to be available directly from [Waveshare.com](http://www.waveshare.com/product/mini-pc/raspberry-pi.htm).

If required, you can adjust the available configuration for your own needs.

##Custom HDMI Settings##
The selected screen is a 5" HDMI display with a resolution of 800x480 (matching the resolution of the official 7" RPi DSI display).

While the screen will connect to any Raspberry Pi via the HDMI connection and simply work, the display does not fully fill the screen (the built in hardware does not include a video re-scaler).

<img src="img/HDMIscreen800x600default.jpg" width=250 />

Fortunately, this can be corrected in the `/boot/config.txt` file with the following commands (thanks to [Adafruit](https://learn.adafruit.com/adafruit-5-800x480-tft-hdmi-monitor-touchscreen-backpack/raspberry-pi-config) for the information):

<img src="img/HDMIscreen800x600configtxt.jpg" width=250 />

<pre>
hdmi_group=2
hdmi_mode=1
hdmi_mode=87
hdmi_cvt=800 480 60 6 0 0 0
</pre>

For info, the `hdmi_cvt` settings mean the following:
<pre>
hdmi_cvt=<width> <height> <framerate> <aspect> <margins> <interlace> <rb>
width        width in pixels
height       height in pixels
framerate    framerate in Hz
aspect       aspect ratio 1=4:3, 2=14:9, 3=16:9, 4=5:4, 5=16:10, 6=15:9
margins      0=margins disabled, 1=margins enabled
interlace    0=progressive, 1=interlaced
rb           0=normal, 1=reduced blanking
</pre>

When the Raspberry Pi is restarted the screen should fill the display.

<img src="img/HDMIscreen800x600configured.jpg" width=250 />

###_RUNONCE###
This recipe will use the `insert_line.sh` script provided by the `001-startup` recipe to add the settings to the existing `/boot/config.txt` file.

Users can add and select their own versions of the `install_customhdmi.sh` script for their own settings.

##Touch-screen Support##
The selected display uses a [XPT2046 Touch Controller](https://ldm-systems.ru/f/doc/catalog/HY-TFT-2,8/XPT2046.pdf) which can be enabled using the [supplied drivers](https://www.copy.com/s/JUdBakcI2LWo6817).

The drivers seem to include support for SPI screens too, so not all the parts are needed.

To enable the driver for the touch screen we need:
`/boot/config/txt`
<pre>
dtoverlay=ads7846,penirq=25,speed=10000,penirq_pull=2,xohms=150
</pre>

To configure the touchscreen we can use `xinput`.  Installed with:
 `deb\xinput-calibrator_0.7.5-1_armhf.deb`

**XInput** can be run directly from the desktop menu or we can add `bin\xinput_calibrator_pointercal.sh` to run on startup.

##Additional information##
Video modes and switching:

For example potentially we could setup the **016-display-switcher** recipe to switch to the custom modes on-the-fly) see the [RPi forum - Custom HDMI modes](https://www.raspberrypi.org/forums/viewtopic.php?f=29&t=24679).

[Information on the Touch Drivers](https://github.com/notro/fbtft/wiki/Touchpanel)

[Touch calibration](https://github.com/notro/fbtft/wiki/FBTFT-on-Raspian)
