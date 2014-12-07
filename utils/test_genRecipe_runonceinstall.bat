set RECIPE_NAME=runonceinstall

set GPP_PATH="./win-gpp/gpp"
set TEXTPAR_PATH="./win-textparser/textparser.exe"
set DIRECTORY=../sdcard/pi-kitchen/%RECIPE_NAME%
set RECIPE_DIRECTORY=../recipes
set TEMPLATE_FILE=TMP_README_RECIPE_CARD.md
REM set THETARGETFILE=README.md
set TEMPLATE_FILE_HTML=TMP_RECIPE_CARD.html
set THETARGETFILE_HTML=%RECIPE_NAME%_RECIPE_CARD.html

REM Instead of generating README.md file it will be used
REM to provide the description for the HTML file, this
REM will avoid duplicating info.
REM %TEXTPAR_PATH% %TEMPLATE_FILE%
REM %GPP_PATH% -O "%DIRECTORY%/%THETARGETFILE%" output.txt -I"%DIRECTORY%"

%TEXTPAR_PATH% %TEMPLATE_FILE_HTML%
%GPP_PATH% -O "%RECIPE_DIRECTORY%/%THETARGETFILE_HTML%" output.txt -I"%DIRECTORY%"

pause