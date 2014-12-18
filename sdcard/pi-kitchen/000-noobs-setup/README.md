This recipe has two functions:
1 - When setting up a Pi-Kitchen SD-Card this recipe includes `switchnoobs.bat` which will allow a Windows based PC to switch between the NOOBS setups.

2 - When installed on a Raspberry Pi, `switchnoobs.sh` is added to the `pi/bin` directory, allowing easy switching of the NOOBS setup from the Raspberry Pi itself.

><img style="float:left" src="IMG_SRC/warn.png" height=40/>
**WARNING:** If you have altered the `flavours.json` file to add your own custom flavours then you **must** update the files within the `_flavours` directory:

>`flavours.json.auto`
>`flavours.json.autodev`
>`flavours.json.normal`
>`RaspbianPiKitchen.png`
>`RaspbianPiKitchenDev.png`

>Also if you have changed the `partitions.json` file or added your own content to `data.tar.xz` you will need to update these files.
>`partitions.json`
>`data.tar.xz`

>These will be used to replace the active ones when switching between setups.  If you make any changes to these files in the distribution folder, ensure you update these ones too.

##Easy Pi-Kitchen setup##
This recipe also provides a quick way to setup the additional flavours (as described in the <a href="http://pihw.wordpress.com/guides/pi-kitchen/creatingflavours/">Pi-Kitchen Guide: Creating Flavours</a>).

It performs the following actions (when a GUI / Normal installation is selected):

- Sets `recovery.cmdline` to run the GUI / Normal (run shift is pressed during startup).

- Replaces the pre-configured `flavours.json` file into the `os/Raspbian` folder with one which has the additional `RaspbianPiKitchen` and `RaspbianPiKitchenDev` flavours.

- Copies over the custom icons (if not already present).

<img style="float:left" src="_flavours/RaspbianPiKitchen.png" height=40/>
<img style="float:left" src="_flavours/RaspbianPiKitchenDev.png" height=40/>

- Enables the data partition as part of the installation (replacing `partitions.json` and adding `data.tar.xz` (if not already present)).

><img style="float:left" src="IMG_SRC/note.png" height=40/>
**NOTE:** This does not install noobsconfig, the NOOBS system or any recipe files.

To complete the **Multi-flavour setup** as described in <a href="http://pihw.wordpress.com/guides/pi-kitchen/quickstart/">Pi-Kitchen Guide: Quick Start</a>) you will need to:

1. Extract [noobsconfig](https://github.com/procount/noobsconfig/blob/master/noobsconfig.zip?raw=true)

2. Add your own `boot/root/data` recipe files.

##Automatic Installations##
As explained in the <a href="http://pihw.wordpress.com/guides/pi-kitchen/automaticinstallations/">Pi-Kitchen Guide: Automatic Installations</a> there are a number of steps required in order to allow NOOBS to perform an automated (also known as headless - since a display isn't required).

- Sets `recovery.cmdline` to run silent NOOBS install (no user interaction is required).

- Replaces the pre-configured `flavours.json` file with the selected flavour.

- Disables the other distributions by renaming the `os.json` files.

- Enables the data partition as part of the installation (replacing `partitions.json` and adding `data.tar.xz` (if not already present)).

The `switchnoobs` scripts will perform these actions for you (assuming you have the correct files in the `_flavours` directory).

##GUI Installations##
As mentioned above, by selecting GUI or Normal, the script will set NOOBS to display all the installed distributions and allow manual selection before installation.

##Video Modes##
The configurations supplied allow selection of the video mode used by NOOBS when running the installation.

><img style="float:left" src="IMG_SRC/note.png" height=40/>
**NOTE:** NOOBS 1.3.10 has a bug which means it ignores the `video` option, so selecting a different video mode using this recipe will not make any difference (it will always use HDMI).  So you will need a keyboard to change the video output manually if using anything other than a HDMI screen.  Later versions of NOOBS should have this bug fixed.

##Adding Additional Flavours/Distros##
The `switchnoobs` scripts can easily be extended to allow selection of other distributions or flavours by using a similar format.  You could even create a version which doesn't include the data partition (if desired).

><img style="float:left" src="IMG_SRC/note.png" height=40/>
**NOTE:** There is an open GitHub request on NOOBS which will allow the desired flavour/distribution to be to selected (and automatically installed) directly from the `recovery.cmdline`.  If this implemented, then this will dramatically simplify this recipe.