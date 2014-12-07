This startup recipe forms the foundation for many of the other recipes used in the Pi-Kitchen.

The recipe provides the following features (which will be used by other recipes):
- easy access to the Recovery and Data partitions by mounting them on power up
- a mechanism to perform automatic installations as part of the first post-NOOB install power up
- a method to perform scripted installations at a later point (i.e. for instance when user input or network is required)
- adds conventiant locations from which scripts can automatically be executed on power up (including as background processes)

#What does it do?#
This recipe works by modifying the `local.rc` file to do two additional steps on power up:

1. Automount the Recovery partation and the Data partation (if present) as local directories in the Pi user's home:

`/home/pi/recovery`
`/home/pi/data`

As we will see later, by mounting the Recovery partition we have easy access to the files on the 1st partition of the SD-Card.  This is important since this is the only partition which we can access directly from a Windows computer.
By allowing access to this partition:
1. It is a lot easier to transfer files back and forth from a windows PC or laptop.
2. We can modifiy our Pi-Kitchen setup from the Raspberry Pi itself.

WARNING: The Recovery partition is the partition used by NOOBS, therefore this also provides a means to break NOOBS (i.e. by deleting files or through corruption if there is a power fail while writing to it).  Therefore, this aspect of the recipe does go against the NOOBS "golden rule", that the Raspberry Pi should never interfear with the NOOBS partition.  However, as we shall show, there are advantages to bending this rule so it is up to you.  If you want to avoid mounting the recovery partition feel free to remove these steps from your own recipe, and adjust any scripts which use the `/home/pi/recovery` directory.

2. Runs `/home/pi/bin/startup.sh`:

The `startup.sh` script is our key file for the special features provided in the rest of this recipe, its purpose is to trigger our custom tasks when the Raspberry Pi starts.


#The purpose of `startup.sh`#

The `startup.sh` script works by processing scripts which are placed in special locations, depending upon the location it will do different things.

##The Runonce Directory##
Located at `/home/pi/bin/_RUNONCE` the `startup.sh` script will run any scripts (in alphabetical order) which are located here on the first power up of the Raspberry Pi following a new install.

The recipe also places `runonce-end.sh` in this folder, which will swap the initial verison of `startup.sh` (a special version which causes the `_RUNONCE` scripts to run) with `startup_normal.sh` (a version which doesn't run the `_RUNONCE` scripts).  This allows these scripts to be run once only.

It is intended that any one off installation or configuration scripts are placed in this folder, so that they can be automatically run the first time you start your Raspberry Pi.  All the scripts put here should run without user interaction, so they can be run with or without a screen/keyboard attached (see **The Installonce directory** for installations which need user input).

You can also place a script here to automatically perform a shutdown of the Raspberry Pi (so you can power off safely when the installation has completed), to restart (to ensure new settings have been applied) or perhaps activate some hardware to indicate when your Pi has finished "cooking".

##The Runstart Directory##
Located at `/home/pi/bin/_RUNSTART` and also `/home/pi/recovery/_USER/_RUNSTART` (physically located on the Recovery partition of the SD-Card, which is accessible from windows).

The `startup.sh` script will run any scripts placed in either of these directories (the SD-Card scripts are run after the local ones).    You should avoid placing any scripts here which don't finish on their own (i.e. have a continous loop) or wait for input unless that is intended (for a start up menu system or deadicated demonstration).

##The Runstart Background Directory##
Located at `/home/pi/bin/_RUNSTARTBG` and also `/home/pi/recovery/_USER/_RUNSTARTBG` (physically located on the Recovery partition of the SD-Card, which is accessible from windows).

Just like the standard Runstart directory, the `startup.sh` script will run these scripts, but will do so as a background process.  This is an easy way to run scripts without waiting for them to complete.  This allows you to monitor for GPIO inputs, run backups or use LEDs as indicators, for example.

#The purpose of `installonce.sh`#
The `installonce.sh` script, will not be run automatically, but should be run by the user at a later point.  As like the other directories, any scripts placed within `/home/pi/bin/_INSTALLONCE` will be run.
This will allow a set of installations or settings to be configured following the inital installation.

By deferring these scripts to a later point, we can ensure that the user has the means to control the Raspberry Pi, be it directly with a connected screen and keyboard or through a remote connection.  We can also perform installs which may require network connections (which we may have not needed when performing the NOOBS installation), or use Wifi connections (which might require additional setup), we can even have an option to install packages from a local source.  We can prompt the user to enter passwords and custom settings which we may not want to store within the Recovery partition.