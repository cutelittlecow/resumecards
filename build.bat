@ECHO OFF
SETLOCAL EnableDelayedExpansion

:: SASS/CSS directory aliases
SET _sassdir=_scss\
SET _cssdir=static\stylesheets\

:: Set directory path based on location that Batch file is contained in
SET _dirpath=%~dp0

CALL scss --sourcemap=none --no-cache "%_dirpath%%_sassdir%resumecards.scss" "%_dirpath%%_sassdir%resumecards.css" --style compressed
MOVE "%_dirpath%%_sassdir%resumecards.css" "%_dirpath%%_cssdir%"
