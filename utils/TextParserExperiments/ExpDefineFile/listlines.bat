set THEDEFINEFILE=test.txt

::read %THECSVFILE% and loop through each line
for /F "usebackq tokens=* delims=" %%A in (%THEDEFINEFILE%) do (
    set the_line=%%A
    call :process_line
)
goto TheEnd

:process_line
for /F "usebackq tokens=1,2,3,4,5,6,7,8,9,10 delims=~" %%1 in ('%the_line:,=~%') do (
    echo "Value 1:%%1
    echo "Value 2:%%2
    echo "Value 3:%%3
    echo "Value 4:%%4
)

:TheEnd
pause