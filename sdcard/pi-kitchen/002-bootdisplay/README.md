This recipe places a selection of selectable display settings on to the SD-Card.

The config.txt allows you to specify the configuration of the Raspberry Pi on boot (such as the display).

This allows you to specify the specific display you wish to use with the Raspberry Pi when it boots.  You can select a particular display within the recipe file as well as change the selected display using the supplied script.

In addition to the display output type you can also specify a number of options to fine tune the display:

- overscan values for left/right/top/bottom allow you to remove any black boarders/overlap off the screen

- framebuffer height and width allows adjustment of the screen resolution (useful for small screens)

This is particularly useful if you are using a smaller/custom screen where the output is difficult to read if not configured carefully.

The intention is that if you use a range of different screens you can add your own variants to the supplied configurations.  This will allow you to quickly and easily switch between them (as well as apply the settings automatically as part of your Pi-Kitchen installation).

This file can also control more than the display settings (such as codex licensing and overclocking), more details are available here:
<a href="http://elinux.org/RPiconfig">Raspberry Pi (elinux) Wiki for RPiconfig</a>. 

A fully documented version of the config.txt file is available here:
<a href="https://raw.githubusercontent.com/Evilpaul/RPi-config/master/config.txt">Documented config.txt</a>