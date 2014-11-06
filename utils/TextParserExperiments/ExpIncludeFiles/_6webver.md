WEB_HEADER: This standard text will be included for web pages!


<!--This is a standard comment-->



Keep this text (always defined within the file)


This text is shown if disabled

#Dealing with image references#
We treat image references as a special case, anything with img / will be converted to IMG_ SRC by our TextParser.
We can then define IMG_ SRC to be our webpage path for images:
i.e. https://raw.githubusercontent.com/PiHw/Pi-Stop/master/markdown_source/https://raw.githubusercontent.com/PiHw/Pi-Stop/master/markdown_source/img/
This allows us to define a new path for the images.
<img src="https://raw.githubusercontent.com/PiHw/Pi-Stop/master/markdown_source/img/pihwlogotm.png" height=200 /> 

Text always here


#Dealing with markdown file references - using define #
HTML Version
> <a href="https://github.com/PiHw/Pi-Stop/blob/master/markdown_source/Discover-PiStop.md">**Discover: The Pi-Stop**</a>: For more information about Pi-Stop and how to use it.
 
Markdown Version

> [**Discover: The Pi-Stop**](https://github.com/PiHw/Pi-Stop/blob/master/markdown_source/Discover-PiStop.md): For more information about Pi-Stop and how to use it.

WEB_FOOTER: This text will appear at the end of webpages.


