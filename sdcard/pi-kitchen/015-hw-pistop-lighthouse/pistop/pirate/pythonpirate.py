#!/usr/bin/python3
#pythonpirate.py

#This will use the previous scripts piratecode.py and lighthouse.py.
import piratecode as CODE #Comment out this line in Part 4
#import morsecode as CODE #Uncomment this in Part 4
import lighthouse as LIGHT

DEBUG=False

def ReadCodedMessage():
   """
   Prompt for a coded message:
   i.e. *-- *** * / *--
   Also check all characters are valid.
   """
   while(1):
      codedmessage = input("Enter Coded Message:")
      if DEBUG:print(codedmessage)
      #check signal
      if not all(x in ["-","*"," ","/"] for x in codedmessage):
         if DEBUG:print("Use: -=Long flash *=Short flash")
      else:
         return codedmessage

def PlayCodedMessage(codedmessage):
   """Convert a coded message into a signal and display on the Pi-Stop."""
   signal2Play=CODE.GetSignal(codedmessage)
   LIGHT.SendLighthouseSignal(signal2Play,signal2Play,signal2Play)

def PlayAgain(codedmessage):
   """Prompt to play the signal again or not."""
   while(1):
      answer = input("Play again? Y/N:")
      if (answer.upper().startswith("Y")):
         PlayCodedMessage(codedmessage)
      elif (answer.upper() == "N"):
         return

def PlayMessage(message):
   """
   Transmit a message
   i.e. “N E S W”
   As a coded signal:
   “-* * *** *--“
   Display it on the Pi-Stop.
   """
   codedmessage = CODE.GetCodedMessage(message)
   if DEBUG:print(codedmessage)
   PlayCodedMessage(codedmessage)

def DecodeCodedMessage(codedmessage):
   """
   Convert a coded signal into the message.
   i.e. -* = N
   """
   message = CODE.GetMessage(codedmessage)
   return message

def main():
   """
   The sequence for finding the treasure...
   >Enter the signal: -*
   >Playback on the Pi-Stop
   >Play again?
   >Show the message... N
   Go to the North Lighthouse, and enter the signal from the light there...
   """
   codedmessage = ReadCodedMessage()
   PlayCodedMessage(codedmessage)
   PlayAgain(codedmessage)
   message = DecodeCodedMessage(codedmessage)
   if (message=="?"):
      if DEBUG:print("Unknown code - try again!")
   else:
      if DEBUG:print ("Message: ", message)
    

if __name__=="__main__":
   DEBUG=True
   while(1):
      main()
