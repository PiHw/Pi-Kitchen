STD_HEADER: This standard text will be included for all pages!
STD_HEADER: <!--File generated from pihw.com-->




<!--This is a standard comment-->



Keep this text (always defined within the file)


This text is shown if disabled

#Dealing with image references#
We treat image references as a special case, anything with img / will be converted to IMG_ SRC by our TextParser.
We can then define IMG_ SRC to be our webpage path for images:
i.e. https://raw.githubusercontent.com/PiHw/Pi-Stop/master/markdown_source/IMG_SRC/
This allows us to define a new path for the images.
<img src="IMG_SRC/pihwlogotm.png" height=200 /> 

Text always here


#Dealing with markdown file references - using find and replace#
> [**Discover: The Pi-Stop**](Discover-PiStop.md): For more information about Pi-Stop and how to use it.


