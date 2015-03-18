#Support for Pi-Kitchen recipe 013-enable-i2c-spi-i2s
#Allows the driver to be enabled if the listed overlay file is present in /boot/overlays
#The device is disabled if the overlay file i.e. enable-i2s-overlay.dtb is moved to /boot/overlays/disabled
dtoverlay=enable-i2c-arm
dtoverlay=enable-i2s
dtoverlay=enable-spi