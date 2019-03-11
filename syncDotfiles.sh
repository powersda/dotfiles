#!/usr/bin/env bash

if [ "$1" = "-h" ] || [ "$#" -ne 2 ]; then
    echo "Usage: ./syncDotfiles.sh {dotfile list} {storage directory}"
    exit 1
elif [ ! -f "$1" ]; then
    echo "Passed dotfile list does not exist! Exiting..."
    exit 1
fi

if [ ! -d "$2" ]; then
    mkdir "$2"
fi

for line in $(cat "$1"); do
    fileName="${line#*/}"
    expandedDirectory="${line/\~/$HOME}"
    dotfileDirectory="$2"
    
    if [ ! -e "$expandedDirectory" ]; then
        echo "\""$line"\" does not exist!"
    else
        if [ -f "$expandedDirectory" ] && [ ! -h "$expandedDirectory" ]; then
            if [[ "$fileName" == */* ]] && [ ! -d "${fileName%/*}" ]; then
                mkdir -p "$dotfileDirectory"/"${fileName%/*}"
            fi
            mv "$expandedDirectory" "$dotfileDirectory"/"$fileName" && echo "Moved \"$fileName\" to "$dotfileDirectory""
        fi

        if [ -f "$dotfileDirectory"/"$fileName" ]; then
            ln -sf "$PWD"/"$dotfileDirectory"/"$fileName" "$expandedDirectory" && echo "Created/updated symlink at "$expandedDirectory""
        else
            echo "Failed to retrieve "$expandedDirectory". No symlink created!."
        fi
    fi
done

exit 
