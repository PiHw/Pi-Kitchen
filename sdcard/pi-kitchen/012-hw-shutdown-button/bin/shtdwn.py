#!/usr/bin/python3
import time
import RPi.GPIO as GPIO
import os

# Shutdown Script
DEBUG=False
SNDON=False

#HARDWARE SETUP
GPIO_MODE=GPIO.BOARD
# Location A
HWSETUP_A=[22,24,26]
# 2[=========X1L2]26[=======]40
# 1[=============]25[=======]39
# Location B
HWSETUP_B=[23,21,19]
# 2[=============]26[=======]40
# 1[=========2L1X]25[=======]39
# Location A+
HWSETUP_A_PLUS=[36,38,40]
# 2[=============]26[===X1L2]40
# 1[=============]25[=======]39
# Location B+
HWSETUP_B_PLUS=[37,35,33]
# 2[=============]26[=======]40
# 1[=============]25[===2L1X]39

#Automatically select location based on model revision
if GPIO.RPI_REVISION < 3: #Not a plus model (26 Pin GPIO)
  HWSETUP=HWSETUP_B_PLUS  #Selected Location BPlus
else:                     #A plus model (40 Pin GPIO)
  HWSETUP=HWSETUP_B       #Selected Location B
#BTN CONFIG - Set GPIO Ports
SHTDWN_BTN = HWSETUP[0] #1
LED = HWSETUP[1]        #L
SWITCH = HWSETUP[2]     #2

ledon=True
actionState=False

def gpio_setup():
  #Setup the wiring
  GPIO.setmode(GPIO_MODE)
  #Setup Ports
  GPIO.setup(SHTDWN_BTN,GPIO.IN,pull_up_down=GPIO.PUD_UP)
  GPIO.setup(SWITCH,GPIO.IN,pull_up_down=GPIO.PUD_UP)
  GPIO.setup(LED,GPIO.OUT)

def doShutdown():
  if(DEBUG):print("Press detected")
  time.sleep(3)
  if GPIO.input(SHTDWN_BTN):
    if(DEBUG):print("Ignore the shutdown (<3sec)")
  else:
    if(DEBUG):print ("Would shutdown the RPi Now")
    GPIO.output(LED,0)
    time.sleep(0.5)
    GPIO.output(LED,1)
    if(SNDON):os.system("flite -t 'Warning commencing power down in 3 2 1'")
    if(DEBUG==False):os.system("sudo shutdown -h now")
    if(DEBUG):exit()

def doChangeAction():
  global actionState
  if(DEBUG):print("Action Status: %s" % actionState)
  if GPIO.input(SWITCH) and actionState==True:
    if(DEBUG):print("Action Switch OFF")
    cmd="sudo sh shtdwn_actionoff.sh"
    actionState=False
    GPIO.output(LED,1)
  elif GPIO.input(SWITCH)==False and actionState==False:
    if(DEBUG):print("Action Switch ON")
    cmd="sudo sh shtdwn_actionon.sh"
    actionState=True
  else:
    return
  os.system(cmd)
  return

def flashled():
  global ledon
  if ledon:
    ledon=False
  else:
    ledon=True
  GPIO.output(LED,ledon)

def main():
  gpio_setup()
  GPIO.output(LED,1)
  while True:
    if(DEBUG):print("Waiting for >3sec button press")
    if GPIO.input(SHTDWN_BTN)==False:
       doShutdown()
    doChangeAction()
    if actionState:
      flashled()
    time.sleep(1)

try:
  main()
finally:
  GPIO.cleanup()
  print("Closed Everything. END")
#End
