The standard NOOBS install also triggers a program called `raspi-config` to run on the first boot of the operating system.

Although this program contains many useful settings, we can now apply our own settings using the Pi-Kitchen so we do not need this.  

Particularly important is if we create an automatic installation, we may not even have a keyboard or display attached.  Therefore, `raspi-config` may cause an issue on the first boot, as it will sit there waiting for user input rather than continuing with our own startup/installation scripts.

><img style="float:left" src="IMG_SRC/note.png" height=40/><b>NOTE:</b> If you do want to run `raspi-config` at a later point, you can, just use the command `sudo raspi-config`.

##Stopping `raspi-config` running##
We can stop `raspi-config` running by replacing the script which normally runs it with an alternative.

The recipe will replace `etc/profile.d/raspi-config.sh` which doesn't include the call to `raspi-config`.

##Performing post `raspi-config` steps##
Once `raspi-config` runs (located at `/usr/bin/raspi-config`), it performs two actions:

1. It deletes the `etc/profile.d/raspi-config.sh` script (we don't need to do this since our version doesn't run `raspi-config`).
2. It modifies `etc/inittab`.

The `etc/inittab` file **before** `raspi-config`:
`#1:2345:respawn:/sbin/getty --noclear 38400 tty1 # RPICFG_TO_ENABLE`
`1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1 # RPICFG_TO_DISABLE`

The `etc/inittab` file **after** `raspi-config`:
`1:2345:respawn:/sbin/getty --noclear 38400 tty1 # RPICFG_TO_ENABLE`
`#1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1 # RPICFG_TO_DISABLE`

Within `raspi-config` the program performs the following actions:

	disable_raspi_config_at_boot() {
	  if [ -e /etc/profile.d/raspi-config.sh ]; then
	    rm -f /etc/profile.d/raspi-config.sh
	    sed -i /etc/inittab \
	      -e "s/^#\(.*\)#\s*RPICFG_TO_ENABLE\s*/\1/" \
	      -e "/#\s*RPICFG_TO_DISABLE/d"
	    telinit q
	  fi
	}

Additionally, we have to set the environment variable `TERM` (for some reason this is not set if `raspi-config` is not run on start up).  If not then programs will not run correctly from the command line:

`Error Opening Terminal: Unknown`

`tput: No value for $TERM and no -T specified`

This only happens when connected to a local screen - remote connections do not have a problem (hence I did not notice until I used a HDMI screen).

Therefore we add the following to `etc/profile.d/raspi-config.sh` to fix this:

`TERM=xterm`

><img style="float:left" src="IMG_SRC/warn.png" height=40/><b>WARNING:</b> Although this recipe does work, there are still parts which I am not happy with.  The terminal is fine for remote connections, but the local (via a screen) has `pi@raspberrypi` added to the terminal name.  However it does the job and allows the start-up scripts to run.  This recipe will be updated when I've fixed it.