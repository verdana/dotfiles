#!/bin/sh

for file in async.zsh pure.zsh
do
    echo $file
    wget https://raw.githubusercontent.com/sindresorhus/pure/master/$file
done

mv async.zsh async
mv pure.zsh  prompt_pure_setup

# vim: set fdm=marker ff=unix sw=4 ts=4 et: #

