#!/usr/bin/python3
# trafficlights.py
#
import pistop as PS
import time

def run(pistop):
   pistop.output(PS.all,PS.OFF)
   time.sleep(5)
   pistop.output(PS.R,PS.ON)
   pistop.output((PS.Y,PS.G),PS.OFF)
   time.sleep(1)
   while(True):
      #Go
      pistop.output((PS.R,PS.Y),PS.ON)
      pistop.output(PS.G,PS.OFF)
      time.sleep(1)
      pistop.output(PS.G,PS.ON)
      pistop.output((PS.R,PS.Y),PS.OFF)
      time.sleep(10)
      #Stop
      pistop.output(PS.Y,PS.ON)
      pistop.output((PS.R,PS.G),PS.OFF)
      time.sleep(1)
      pistop.output(PS.R,PS.ON)
      pistop.output((PS.Y,PS.G),PS.OFF)
      time.sleep(10)


if __name__ == '__main__':
   with PS.PiStop("A") as myPiStop:
      run(myPiStop)
