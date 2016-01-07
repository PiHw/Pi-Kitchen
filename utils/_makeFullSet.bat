REM The %%~dpnxF expands to drive, path, basename and extension of the current file.
REM Clear Current Recipe Index file
set RECIPE_DIRECTORY=../recipes
set TEMPLATE_INDEX_FILE_MD=TMP_RECIPE_INDEX.md
del "%RECIPE_DIRECTORY%/%THETARGETINDEXFILE_MD%" /Q

REM Process all the recipe files
.\genFiles.bat recipelist.txt

pause