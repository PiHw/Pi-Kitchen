@echo off
REM For info on "for /F" see http://www.computerhope.com/forhlp.htm

REM Read in the parameters for the target file and the define file
if [%1] == [] (
  set RECIPE_NAME=001-startup
) else (
  set RECIPE_NAME=%1
)
echo Recipe: %RECIPE_NAME%

set GPP_PATH="./win-gpp/gpp"
set TEXTPAR_PATH="./win-textparser/textparser.exe"
set DIRECTORY=../sdcard/pi-kitchen/%RECIPE_NAME%
set RECIPE_DIRECTORY=../recipes
set TEMPLATE_FILE=TMP_README_RECIPE_CARD.md
set TEMPLATE_FILE_MD=TMP_RECIPE_CARD.md
set THETARGETFILE_MD=%RECIPE_NAME%_RECIPE_CARD.md

%TEXTPAR_PATH% %TEMPLATE_FILE_MD%
%GPP_PATH% -O "%RECIPE_DIRECTORY%/%THETARGETFILE_MD%" output.txt -I"%DIRECTORY%"
)

:TheEnd