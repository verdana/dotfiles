@echo off

set DOT_DIR=D:\Github\dotfiles

rmdir   /S /Q   %USERPROFILE%\AppData\Local\nvim
mklink  /J      %USERPROFILE%\AppData\Local\nvim\           %DOT_DIR%\vim

mklink          %USERPROFILE%\AppData\Local\nvim\init.vim   %DOT_DIR%\vimrc
mklink          %USERPROFILE%\AppData\Local\nvim\ginit.vim  %DOT_DIR%\vimrc-gui

PAUSE
