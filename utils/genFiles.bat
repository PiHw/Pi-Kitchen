@echo on
REM For info on "for /F" see http://www.computerhope.com/forhlp.htm

set GPP_PATH="./win-gpp/gpp"

REM Read in the parameters for the target file and the define file
if [%2] == [] (
  set THETARGETFILE=testing.md
) else (
  set THETARGETFILE=%1
)
if [%2] == [] (
  set THEDEFINEFILE=directorylist.txt
) else (
  set THEDEFINEFILE=%2
)
echo Target File:%THETARGETFILE%
echo Define File: %THEDEFINEFILE%


::read %THECSVFILE% and loop through each line
for /F "usebackq eol=; tokens=* delims=" %%A in (%THEDEFINEFILE%) do (
    set the_line=%%A
    call :process_line
)
goto TheEnd

:process_line
for /F "usebackq tokens=1,2,3,4,5,6,7,8,9,10 delims=~" %%1 in ('%the_line:,=~%') do (
    echo Directory: %%~1
    echo Define1:   %%~2
    echo Define2:   %%~3
    echo Define3:   %%~4

    if NOT [%%~1]  == [] (set the_directory=..\markdown_generated\%%~1)  else (set the_directory=)
    if NOT [%%~2]  == [] (set arg1=-D%%~2)  else (set arg1=)
    if NOT [%%~3]  == [] (set arg2=-D%%~3)  else (set arg2=)
    if NOT [%%~4]  == [] (set arg3=-D%%~4)  else (set arg3=)
    if NOT [%%~5]  == [] (set arg4=-D%%~5)  else (set arg4=)
    if NOT [%%~6]  == [] (set arg5=-D%%~6)  else (set arg5=)
    if NOT [%%~7]  == [] (set arg6=-D%%~7)  else (set arg6=)
    if NOT [%%~8]  == [] (set arg7=-D%%~8)  else (set arg7=)
    if NOT [%%~9]  == [] (set arg8=-D%%~9)  else (set arg8=)

REM    echo \win-gpp\gpp.exe %arg1% %arg2% %arg3% %arg4% %arg5% %arg6% %arg7% %arg8% -o ..\%the_directory%\%%~nTHETARGETFILE#.md output.txt

    if NOT [%the_directory%] == [] (
        mkdir %the_directory%
     )
     %GPP_PATH% -O %the_directory%\%THETARGETFILE% output.txt -Iinc_%the_directory% %arg1% %arg2% %arg3% %arg4% %arg5% %arg6% %arg7% %arg8%
     pause

)


:TheEnd