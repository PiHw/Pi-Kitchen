#!/usr/bin/python3
#lighthouse.py
import time
import RPi.GPIO as GPIO #Used to interface with hardware on the Raspberry Pi.

DEBUG=False

#Sets the pins used for the Pi-Stop:
#HARDWARE SETUP
# Model+ P1
# 2[=========XGYR]26
# 1[=============]25
LED=[26,24,22] #RED, YELLOW, GREEN
# Model+ P1
# 2[===============XGYR]40
# 1[===================]39
#LED=[40,38,36] #RED, YELLOW, GREEN (uncomment to use)

#Define some values to use later in the script.
FLASH_TIME=0.3
RED,YELLOW,GREEN=0,1,2
ON,OFF=True,False

def GPIOsetup():
   """
   Use GPIO.BOARD so we can call the pins by their physical position in P1.
   Set each of the pins as outputs.
   """
   GPIO.setmode(GPIO.BOARD)
   for led in (RED,YELLOW,GREEN):
      GPIO.setup(LED[led],GPIO.OUT)

def ShowSignal(state):
   """
   We can use this function to display the state the Pi-Stop
   LEDs will be set to. i.e. “ “=OFF “#”=ON
   """
   for led in (RED,YELLOW,GREEN):
      if (state[led]):
         if DEBUG:print("# ",end="")
      else:
         if DEBUG:print("  ",end="")
   if DEBUG:print("")

def ControlLights(state):
   """
   Control the Pi-Stop LEDs by setting them to the required
   states (and wait).
   i.e. TRUE=ON FALSE=OFF
   """
   for led in (RED,YELLOW,GREEN):
      GPIO.output(LED[led],state[led])
   time.sleep(FLASH_TIME)

def SendLighthouseSignal(signalRED,signalYELLOW,signalGREEN):
   """
   This function can display 3 different signals at the same time. 
   """
   numItems=[]
   allsignals=[signalRED,signalYELLOW,signalGREEN]
   #Find the length of each signal.
   for signal in allsignals:
      numItems.append(len(signal))
   #Take the first item of each signal and make into a list
   #of states to set each LED:
   #=> [ON, OFF, ON]
   #Continue until we have processed all the items in the
   #longest signal (using OFF for completed signals).
   for i in range(max(numItems)):
      state=[]
      for led in (RED,YELLOW,GREEN):
         try:
            state.append(allsignals[led][i])
         except IndexError:
            state.append(OFF)
      #Display the states on screen before controlling the Pi-Stop LEDs. 
      ShowSignal(state)
      ControlLights(state)

#We always want to setup the pins, so we can do this here.
GPIOsetup()

if __name__=="__main__":
   """
   The following code is only run when the file is run
   directly, so we can put any test code here.
   """
   #This will use the previous script piratecode.py, so make
   #sure your script is located within the same directory.
   import piratecode as CODE
   DEBUG=True
   
   #Displays the code for:
   #"W W W W W W"
   codedmessage=CODE.GetCodedMessage("W W W W W W")
   print(codedmessage)
   #You will see:
   #*-- / *-- / *-- / *-- / *-- / *--

   #Create different signals for the Pi-Stop to display.
   #Including a lower case message to check we can handle it nicely.
   signal1=CODE.GetSignal(codedmessage)
   codedmessage=CODE.GetCodedMessage("W W W S S S")
   signal2=CODE.GetSignal(codedmessage)
   codedmessage=CODE.GetCodedMessage("w W W N N N N") 
   signal3=CODE.GetSignal(codedmessage)
   
   #Display the signals on the screen and on the Pi-Stop.
   SendLighthouseSignal(signal1,signal2,signal3)
   #You will see:
   # # # 
         
   # # # 
   # # # 
   # # # 
   # # # 
         
   # # # 
   # # # 
   # # # 
   # # # 
   #...etc...
   #The Pi-Stop lights will match the # characters.
   #The lights will start the same “W” and then show different
   #signals i.e. “S” and “N”.
   
   
   #Check what happens if we use a letter not available?
   codedmessage=CODE.GetCodedMessage("WWL")
   signal4=CODE.GetSignal(codedmessage)
   SendLighthouseSignal(signal4,signal4,signal4)
   #You will see:
   #Error: Letter not found ( L )
   #Error: Code not found

  
