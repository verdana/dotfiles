#!/bin/sh

for file in async.zsh pure.zsh
do
    [ -f $file ] && ( mv $file ${file}.bak )

    wget -q https://raw.githubusercontent.com/sindresorhus/pure/master/$file
done

# vim: set fdm=marker ff=unix sw=4 ts=4 et: #

