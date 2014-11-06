@echo off
REM The %%~dpnxF expands to drive, path, basename and extension of the current file.

REM List all the source files
for %%F in (..\..\..\markdown_source\markdown\*.md) do (
  echo ---Source File: %%~nxF
)

REM Process all the source files
for %%F in (..\..\..\markdown_source\markdown\*.md) do (
  ..\..\win-textparser\textparser.exe ..\..\..\markdown_source\markdown\%%~nxF
  processFiles.bat %%~nF#.md defines.txt
)


pause