#!/usr/bin/python3
# pistop.py
#
# PiStop Python Class
#
# by Tim Cox (@PiHardware)
#
# For workshops and further details see https://github.com/PiHw/Pi-Stop
# The PiStop is designed and produced jointly by PiHardware and 4Tronix
#
import RPi.GPIO as GPIO

R,Y,G=2,1,0
OFF,ON=0,1
all=(R,Y,G)

#Hardware Setup
location={"A":[22,24,26],
          "B":[23,21,19],
          "C":[12,10,8],
          "D":[7,5,3]}
if GPIO.RPI_REVISION >= 3:
  locPlus={"A+":[36,38,40],
           "B+":[37,35,33]}
  location=dict(list(location.items())+list(locPlus.items()))

pinLocation={ "A": "2[=========XGYR]26[=======]40\n" +
                   "1[=============]25[=======]39",
              "B": "2[=============]26[=======]40\n" +
                   "1[=========RYGX]25[=======]39",
              "C": "2[==XGYR=======]26[=======]40\n" +
                   "1[=============]25[=======]39",
              "D": "2[=============]26[=======]40\n" +
                   "1[=RYGX========]25[=======]39"}
if GPIO.RPI_REVISION >= 3:
  pinLocPlus={"A+":"2[=============]26[===XGYR]40\n" +
                  "1[=============]25[=======]39",
              "B+":"2[=============]26[=======]40\n" +
                   "1[=============]25[===RYGX]39"}
  pinLocation=dict(list(pinLocation.items())+list(pinLocPlus.items()))


class LocationInvalid(Exception):
    pass

class PiStop():
  def printLoc(loc):
      print("PiStop Location: %s" % loc)
      print(pinLocation[loc])
    
  def showSetup(hwSetup=all):
    if hwSetup==all:
      for loc in location.keys():
        PiStop.printLoc(loc)
    else:
      for loc in location.keys():
        if hwSetup==location[loc]:
          PiStop.printLoc(loc)

  def __init__(self,hwSetup="A",DEBUG=False):
    self.DEBUG=DEBUG
    try:
      self.hwSetup=location[hwSetup]
    except KeyError:
      validList=""
      for loc in location.keys():
        validList+=loc+" "
      raise LocationInvalid("Error: PiStop Location %s is invalid\nValid locations are: %s" %(hwSetup,validList))
    else:
      self.showSetup = self.__showSetup
      if self.DEBUG:print("Setup GPIO")
      if self.DEBUG:print("Pins: %s" % self.hwSetup)

      #Setup the wiring
      #GPIO.setwarnings(False)
      GPIO.setmode(GPIO.BOARD)
      for pin in all:
        GPIO.setup(self.hwSetup[pin],GPIO.OUT)

  def __enter__(self):
    if self.DEBUG:print("Enter Class")
    self.output(all,OFF)
    return self

  def __exit__(self,type,value,traceback):
    GPIO.cleanup()
    if self.DEBUG:print("Class Exit")

  def __showSetup(self):
    PiStop.showSetup(self.hwSetup)

  def output(self,pins,state):
    #Determine if "pins" is a single interger or a list
    if isinstance(pins,int):
      #Single integer - update pin
      pin=pins
      if self.DEBUG:print("Pin:%s State:%s" %(self.hwSetup[pin],state))
      GPIO.output(self.hwSetup[pin],state)
    else:
      #is a list, cycle through "pins" list 
      for pin in pins:
        if self.DEBUG:print("Pin:%s State:%s" %(self.hwSetup[pin],state))
        GPIO.output(self.hwSetup[pin],state)

def testSequence(pistop):
    pistop.showSetup()
    time.sleep(5)
    pistop.output(all,ON)
    time.sleep(5)
    pistop.output(all,OFF)
    pistop.output(G,ON)
    time.sleep(1)
    pistop.output(G,ON)
    time.sleep(1)
    pistop.output(R,ON) 
    time.sleep(1)
    pistop.output(all,OFF)


if __name__ == '__main__':
  import time
  PiStop.showSetup()
  print("Test Class!")
  with PiStop(DEBUG=True) as myPiStop:
    testSequence(myPiStop)
  with PiStop("B+") as myPiStopBplus:
    testSequence(myPiStopBplus)
  print("Test bad location")
  with PiStop("AA") as myPiStopBad:
    testSequence(myPiStopBad)    
  print("Done")
