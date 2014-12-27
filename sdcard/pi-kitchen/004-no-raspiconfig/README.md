The standard NOOBS install also triggers a program called `raspi-config` to run on the first boot of the operating system.

Although this program contains many useful settings, we can now apply our own settings using the Pi-Kitchen so we do not need this.  

Particularly important is if we create an automatic installation, we may not even have a keyboard or display attached.  Therefore, `raspi-config` may cause an issue on the first boot, as it will sit there waiting for user input rather than continuing with our own startup/installation scripts.

<img style="float:left" src="IMG_SRC/note.png" height=40/>
<b>NOTE:</b> If you do want to run `raspi-config` at a later point, you can, just use the command `sudo raspi-config`.

##Stopping `raspi-config` running##
We can stop `raspi-config` running by replacing the script which normally runs it with an alternative.

The recipe will replace `etc/profile.d/raspi-config.sh` which doesn't include the call to `raspi-config`.

##Performing post `raspi-config` steps##
Once `raspi-config` runs, it performs two actions:

1. It deletes the `etc/profile.d/raspi-config.sh` script (we don't need to do this since our version doesn't run `raspi-config`).
2. It modifies `etc/inittab`.

The `etc/inittab` file **before** `raspi-config`:
`#1:2345:respawn:/sbin/getty --noclear 38400 tty1 # RPICFG_TO_ENABLE`
`1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1 # RPICFG_TO_DISABLE`

The `etc/inittab` file **after** `raspi-config`:
`1:2345:respawn:/sbin/getty --noclear 38400 tty1 # RPICFG_TO_ENABLE`
`#1:2345:respawn:/bin/login -f root tty1 </dev/tty1 >/dev/tty1 2>&1 # RPICFG_TO_DISABLE`

