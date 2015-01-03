@echo off
REM For info on "for /F" see http://www.computerhope.com/forhlp.htm

set GPP_PATH="./win-gpp/gpp"

REM Read in the parameters for the target file and the define file
if [%1] == [] (
  set THERECIPEFILE=recipelist.txt
) else (
  set THERECIPEFILE=%1
)
echo Recipe List File: %THERECIPEFILE%


::read %THECSVFILE% and loop through each line
for /F "usebackq eol=; tokens=* delims=" %%A in (%THERECIPEFILE%) do (
    echo Directory: %%A
	cd ..\utils\
	genRecipe.bat %%A
	cd ..\utils\
	genZipRecipe.bat %%A
)
goto TheEnd


:TheEnd
pause