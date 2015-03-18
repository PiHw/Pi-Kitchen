#!/usr/bin/python3
#piratecode.py

DEBUG=False

#Create a dictionary to convert letters into * and - codes.
#* is a short flash of the lighthouse
#- is a long flash
letter2code = {' ':'/',
               'N':'-*',
               'E':'*',
               'S':'***',
               'W':'*--'}
               
#Reverse the dictionary so we can convert a code back into letters.
code2letter = dict((v,k) for k,v in letter2code.items())

#Create a dictionary to convert the code into logical ON/OFF signals.
ON,OFF=True,False
code2signal = {'*':[ON,OFF],
               '-':[ON,ON,ON,ON,OFF],
               ' ':[OFF],
               '/':[OFF]*3}

def GetLetter(code):
   """Use the dictionary to convert a code into a letter or return ?"""
   try:
      return code2letter[code]
   except KeyError:
      if DEBUG:print("Error: Code not found (",code,")")
      return "?"

def GetCode(letter):
   """Use the dictionary to convert a letter into a code or return ?"""
   try:
      return letter2code[letter]
   except KeyError:
      if DEBUG:print("Error: Letter not found (",letter,")")
      return "?"

def GetCodedMessage(message):
   """Convert a message i.e. 'NE' into a coded one '-* *'."""
   codedmessage=""
   for letter in message.upper():
      codedmessage += (GetCode(letter))
      codedmessage += (" ")
   return codedmessage

def GetMessage(codedmessage):
   """Decode a coded message i.e. '-* *' -> 'NE'"""
   message=""
   codelist = codedmessage.split(" ")
   for code in codelist:
      message += (GetLetter(code))
   return message

def GetSignal(codedmessage):
   """
   Generate a signal from a codedmessage.
   i.e. '-*' -> '----__-__'
   """
   signal=[]
   for code in codedmessage:
      try:
         signal += code2signal[code]
      except KeyError:
         if DEBUG:print("Error: Code not found")
         return []
   signal += code2signal[" "]
   return signal

if __name__=="__main__":
   """
   The following code is only run when the file is run
   directly, so we can put any test code here.
   """
   DEBUG=True

   #First test GetCode() which uses the letter2code dictionary.
   print(GetCode('N'))
   print(GetCode('E'))
   print(GetCode('S'))
   print(GetCode('W'))
   print(GetCode(' '))
   #You should see:
   #-*
   #*
   #***
   #*--
   #/

   #Next test:
   print(GetLetter('*'))
   print(GetLetter('-*'))
   print(GetLetter('-**'))
   #You should see:
   #E
   #N
   #Error: Code not found ( -** )
   #?
   #Note: When testing we should always test that errors are dealt with nicely.

   #Next test:
   print(GetCodedMessage("NN EE SS WW"))
   print(GetCodedMessage("WEST"))
   #You should see:
   #-* -* / * * / *** *** / *-- *-- 
   #Error: Letter not found ( T )
   #*-- * *** ?
   #Note: There isn’t a code for T so it should report an error.

   #Next test:
   print(GetMessage("*-- * ***"))
   print(GetMessage("*-- **-- -*"))
   #You should see:
   #WES
   #Error: Code not found ( **-- )
   #W?N

   #Final test:
   print(GetSignal("*-- **-- -*"))
   #You should see:
   #[True, False, True, True, True, True, False, True, True,
   # True, True, False, False, True, False, True, False, True,
   # True, True, True, False, True, True, True, True, False,
   # False, True, True, True, True, False, True, False, False]
   
