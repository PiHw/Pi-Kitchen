#!/bin/python3
# This script should allow the display output to be changed automatically
# Will support extra parameters:
# off - display off
# on - display on
# test - test display off and on
# show - show details of current display
# 1-10 - select a particular display
# next - select the next display in the list
# cycle - will slowly cycle through all the display options
# pal - will switch to SDTV PAL
# ntsc - will switch to SDTV NTSC
import curses
import time
import sys
import subprocess
import videomode

DEBUG=True
WAIT=5 #wait time between cycles
KEY = {'NUM_0':48,'NUM_9':59,'ENTER':10,'ESC':27,'q':113,'c':99,'s':115,'o':111,'h':104,'l':108,'k':107,'SPACE':32}


display_to_cmd = {'off':'-o',
                  'hdmi':'-p',
                  'hdmigood':'--explicit="DMT 35 HDMI"',
                  'hdmibad':'--explicit="CEA 4 HDMI"',
                  'pal':'--sdtvon="PAL 4:3"',
                  'ntsc':'--sdtvon="NTSC 4:3"',
                  'show':'-s',
                  'name':'-n',
                  'listcea':'--mode="CEA"',
                  'listdmt':'--mode="DMT"'}

display_order = ['hdmi','hdmibad','pal','ntsc','off']
videomodefile="/home/pi/bin/videomode.py"
index=videomode.VIDEOMODE #Set starting index to zero
program="/opt/vc/bin/tvservice"
program_refresh="fbset -depth 8"
program_refresh2="fbset -depth 16"

def applyDisplay(display):
   '''Send the required command to change the display mode'''
   if DEBUG:print("CMD1:%s %s\n"%(program,display_to_cmd[display]))
   if DEBUG:print("CMD2:%s\n"%(program_refresh))
   commands = "%s %s"%(program,display_to_cmd[display])
   subprocess.call([commands],shell=True)
   subprocess.call([program_refresh],shell=True)
   subprocess.call([program_refresh2],shell=True)
  
def nextDisplay(change):
   '''Select the next (or previous) display mode in the list'''
   global index
   index += change #change the index as requested
   index %= len(display_order) #ensure index is set to correct range
   applyDisplay(display_order[index])

def setDisplay(index_in):
   '''Select the display mode directly from the available list'''
   global index
   #ensure index is set to correct range
   if ((index_in >= 0) & (index_in < len(display_order))):
     index = index_in #change the index as requested
     applyDisplay(display_order[index])
   else:
     print("Invalid option\n")

def listDisplayMode():
   '''List all the display modes supported'''
   print("Available display modes:\n")
   for i,mode in enumerate(display_order):
     print("%s:%s\n"%(i,mode))
   commands = "%s %s"%(program,display_to_cmd['name'])
   subprocess.call([commands],shell=True)
   commands = "%s %s"%(program,display_to_cmd['listdmt'])
   subprocess.call([commands],shell=True)
   commands = "%s %s"%(program,display_to_cmd['listcea'])
   subprocess.call([commands],shell=True)
   

def saveDisplayMode():
   '''Store the current index as VIDEOMODE in videomode.py'''
   print("Saving video mode:%s\n"%(index))
   try:
      with open(videomodefile,'w') as f_out:
         f_out.writelines("VIDEOMODE=%s"%(index))
   except IOError:
      print("Unable to open %s\n" %(videomodefile))

def showHelp():
   print("Switch Video Modes\n")
   print("==================\n")
   print("Enter - show details of current display mode\n")
   print("1-9 - select specific display mode\n")
   print("0/Space - switch display off\n")
   print("Left/Right - select previous/next display mode\n")
   print("c - Cycle through each display mode\n")
   print("l - list available display modes\n")
   print("s - save current mode\n")
   print("q/ESC - Exit\n")
   print("h - this help\n")
   print("Current video mode:%s\n"%(index))


def main():
   '''Allow selection of the required display mode via the keyboard'''
   curses.noecho()
   curses.cbreak()
   stdscr.keypad(True)

   while True:
      c=stdscr.getch()
      if c > 0:
         if DEBUG:print("TEST %s\n"%c)
      if c == KEY["q"]:
         break
      elif c == KEY["ESC"]:
         break
      elif c == curses.KEY_RIGHT:
         if DEBUG:print("Right\n")
         nextDisplay(1)
      elif c == curses.KEY_LEFT:
         if DEBUG:print("Left\n")
         nextDisplay(-1)
      elif ((c > KEY["NUM_0"]) & (c <= KEY["NUM_9"])): #1-9
         if DEBUG:print("number\n")
         setDisplay(c-(KEY["NUM_0"]+1)) #Modes are indexed from 0
      elif c == KEY["NUM_0"]:
         if DEBUG:print("0\n")
         applyDisplay("off")
      elif c == KEY["ENTER"]:
         if DEBUG:print("Enter\n")
         applyDisplay("show")
      elif c == KEY["s"]:
         if DEBUG:print("s\n")
         saveDisplayMode()
      elif c == KEY["l"]:
         if DEBUG:print("l\n")
         listDisplayMode()
      elif c == KEY["o"]:
         if DEBUG:print("o\n")
         applyDisplay("off")
      elif c == KEY["SPACE"]:
         if DEBUG:print("space\n")
         applyDisplay("off")
      elif c == KEY["h"]:
         if DEBUG:print("h\n")
         showHelp()
      elif c == KEY["c"]:
         if DEBUG:print("cycle\n")
         for mode in display_order:
            if DEBUG:print("next\n")
            applyDisplay(mode)
            time.sleep(WAIT)
         if DEBUG:print("cycle done\n")

if __name__=="__main__":
   #Check for command line args
   if len(sys.argv) > 1:
      if DEBUG:print("CMDLine Mode: %s"%(sys.argv))
      for i,cmd in enumerate(sys.argv):
         if i != 0:
            if cmd == "next":
               if DEBUG:print("next")
               nextDisplay(1)
            elif cmd == "prev":
               if DEBUG:print("prev")
               nextDisplay(-1)
            saveDisplayMode()
   else:
      #Initialise curses for keyboard inputs
      stdscr = curses.initscr()
      try:
         main()
      finally:
         '''Perform clean up operations at end of program'''
         curses.echo()
         curses.cbreak()
         stdscr.keypad(False)
         curses.endwin()
#End
