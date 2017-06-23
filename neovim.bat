@echo off

set DOT_DIR=D:\Github\dotfiles

RMDIR   /S /Q   %USERPROFILE%\AppData\Local\nvim
MKLINK  /J      %USERPROFILE%\AppData\Local\nvim            %DOT_DIR%\config\nvim


DEL             %USERPROFILE%\AppData\Local\nvim\init.vim
MKLINK          %USERPROFILE%\AppData\Local\nvim\init.vim   %DOT_DIR%\config\nvim\init.vim

DEL             %USERPROFILE%\AppData\Local\nvim\ginit.vim
MKLINK          %USERPROFILE%\AppData\Local\nvim\ginit.vim  %DOT_DIR%\config\nvim\ginit.vim

PAUSE
