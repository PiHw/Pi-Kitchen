@echo off
set TEXTPASER="../../win-textparser/TextParser"
set GPP_PATH="../../win-gpp/gpp"


REM %TEXTPASER% "filename.md" "output.txt" "<!---,img/,Discover-PiStop.md,--->" ",IMG_SRC/,FILE_SRC/Discover-PiStop.html,"

%TEXTPASER% "filename.md" "output.txt" "<!---,img/,--->" ",IMG_SRC/,"


echo #Test GPP - Standard output
%GPP_PATH% output.txt -O _1standard.md -Iinc_std/

echo #Test GPP - Enabled define output
%GPP_PATH% output.txt -O _2enabled.md -Iinc_enabled/

echo #Test GPP - Set webheader output
%GPP_PATH% output.txt -O _3webheader.md -Iinc_web/

echo #Test GPP - Set nestedinclude output
%GPP_PATH% output.txt -O _4nestedinclude.md -Iinc_nested/

echo #Test GPP - Set image path output
%GPP_PATH% output.txt -O _5imagepath.md  -Iinc_imagepath/

echo #Test GPP - Set file path output
%GPP_PATH% output.txt -O _6webver.md -Iinc_webver/

pause