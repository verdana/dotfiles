#!/bin/bash

dest="$HOME/.config/fish/functions"
files=$(ls -d functions/*.fish)

[ -d "$dest" ] || mkdir -p "$dest"

for f in $files; do
    file=`basename $f`

    if [[ -L "$dest/$file" ]]; then
        rm "$dest/$file"
    fi

    ln -s "`pwd`/$f" $dest/
done

