@ECHO off

setlocal enabledelayedexpansion

set directory=%1

for %%F in (%directory%\*.mp4) do (
	set "output=%directory%\%%~nF_out%%~xF"
	ffmpeg -i %%F -vf "crop=in_w:in_h/2:0:0" -c:a copy !output!
	del %%F
	ren !output! %%~nxF
)