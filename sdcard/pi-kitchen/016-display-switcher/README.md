#Display Switcher#

This recipe allows the current display mode to be switched (between different HDMI settings to also PAL and NTSC analogue output modes).  You can trigger the next display mode by using the ALT+UP keyboard shortcut.

As you can imagine this is a very useful function to have and I plan to extend the ability of this script over time.

If you run the `bin/display_switcher.py` program the following arguments are supported via the commandline:

next - selects the next display mode in the display_order list

prev - selects the previous display mode in the display_order list

If you run the program without any commandline arguments the following keys are valid:

Enter - show details of current display mode
1-9 - select specific display mode
0/Space - switch display off
Left/Right - select previous/next display mode
c - Cycle through each display mode
l - list available display modes
s - save current mode
q/ESC - Exit
h - help

The script uses `/opt/vc/bin/tvservice` to select between the different modes (by default this is 1-HDMI 2-HDMI Safe* 3-PAL 4-NTSC 5-Off but you can configure it to set whichever modes you use).

*HDMI safe mode isn't quite the same as NOOBS HDMI safe since I've yet to find out the settings it uses.

WARNING: This recipe uses a modified version of inittab (to activate the keyboard shortcut) which is also replaced by recipe 011-boot-to-desktop.  Therefore, it if using both these recipes at once it is recommended that you combine the required changes into a single file and update the recipe files to use that version.  Ultimately I will change both of these recipes to edit or combine these files automatically so there isn't a conflict.

