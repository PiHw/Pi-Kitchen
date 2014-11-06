<!---#include "define.txt"--->
<!---#include "start.txt"--->


<!--This is a standard comment-->

<!---#define KEEP--->


<!---#ifdef KEEP--->
Keep this text (always defined within the file)
<!---#endif--->

<!---#ifndef KEEP--->
Do not keep this text (defined within the file)
<!---#endif--->

<!---#ifdef ENABLED--->
This text is only shown if enabled (using an external define)
<!---#else--->
This text is shown if disabled
<!---#endif--->

#Dealing with image references#
We treat image references as a special case, anything with img / will be converted to IMG_ SRC by our TextParser.
We can then define IMG_ SRC to be our webpage path for images:
i.e. https://raw.githubusercontent.com/PiHw/Pi-Stop/master/markdown_source/img/
This allows us to define a new path for the images.
<img src="img/pihwlogotm.png" height=200 /> 

Text always here


<!---#ifdef WEBVER--->
#Dealing with markdown file references - using define WEBVER#
HTML Version
> <a href="FILE_SRC/Discover-PiStop.md">**Discover: The Pi-Stop**</a>: For more information about Pi-Stop and how to use it.
 
Markdown Version

> [**Discover: The Pi-Stop**](FILE_SRC/Discover-PiStop.md): For more information about Pi-Stop and how to use it.
#else
#Dealing with markdown file references - using find and replace#
> [**Discover: The Pi-Stop**](Discover-PiStop.md): For more information about Pi-Stop and how to use it.
<!---#endif--->

<!---#include "stop.txt"--->