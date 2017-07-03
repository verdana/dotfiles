@echo off

set DOT_DIR=D:\Github\dotfiles

RMDIR   /S /Q   %USERPROFILE%\AppData\Local\nvim
MKLINK  /J      %USERPROFILE%\AppData\Local\nvim            %DOT_DIR%\config\nvim

PAUSE
