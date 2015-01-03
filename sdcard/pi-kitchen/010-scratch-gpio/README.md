###Introducing Scratch GPIO###

**Scratch GPIO** was created by **Simon Walters (@cymplecy)** to allow Scratch to interact with physical hardware.  Full details of Scratch GPIO is available on his website:

[http://simplesi.net/scratchgpio/scratch-raspberrypi-gpio/](http://simplesi.net/scratchgpio/scratch-raspberrypi-gpio/)

###Installation###
The recipe includes the Scratch GPIO installation script, allowing it to be installed without requiring an internet connection.  You can also choose to download and install the latest version of the script and also update the script stored in the recipe.

The installation script (`install_scratchgpio.sh`) is placed in the `_INSTALLONCE` directory, so the user can select the method of installation.

If the **Scratch GPIO** link changes (i.e. if a new version is released) then update `install_scratchgpio.sh` as required.

> <img style="float:left" src="IMG_SRC/warn.png" height=40/>
> <b>WARNING: Using Scratch with remote connections </b>
> 
> Currently, there is an issue with Scratch 4 which causes it not to work correctly with **X-11 Forwarding**.  The issue results in "=" characters being generated while connected (this makes Scratch hard to use when you need to type anything).
> 
> Therefore if you need to use **Scratch** via the network you will need to use **VNC** or similar.

