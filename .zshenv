# vim: set ff=unix shiftwidth=4 tabstop=4 expandtab:
#
skip_global_compinit=1

# Default editor
export EDITOR=vim

# History
export HISTFILE="$HOME/.history"
export HISTSIZE=50
export SAVEHIST=$HISTSIZE

# INSTALL PHING
export PHING_HOME=/opt/phing
export PATH=${PATH}:${PHING_HOME}/bin:${HOME}/.gem/ruby/2.0.0/bin
export PHP_CLASSPATH=${PHING_HOME}/classes
export PHP_COMMAND=/usr/local/bin/php
export ZF2_PATH=${HOME}/public/zf2/library

# CYGWIN
export CMAKE_LEGACY_CYGWIN_WIN32=0

