@echo off
REM The %%~dpnxF expands to drive, path, basename and extension of the current file.


for %%F in (..\..\..\markdown_source\*.md) do (
  echo ---Source File: %%~nxF
  echo ---Target File: %%~nF#.md
)

for %%F in (..\..\..\markdown_source\*.md) do (
  ..\..\win-textparser\textparser.exe ..\..\..\markdown_source\%%~nxF
  ..\..\win-gpp\gpp.exe -DTEST1 -o ..\..\..\markdown_generated\%%~nF#.md output.txt
)


pause