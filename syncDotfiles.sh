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
    elif [ -f "$expandedDirectory" ] && [ -e "$dotfileDirectory"/"$fileName" ]; then 
        echo ""$dotfileDirectory"/"$fileName" already exists!"
    else
        if [ -f "$expandedDirectory" ] && [ ! -h "$expandedDirectory" ]; then
            if [[ "$fileName" == */* ]] && [ ! -d "${fileName%*/}" ]; then
                mkdir -p "$dotfileDirectory"/"${fileName%*/}"
            fi
            mv "$expandedDirectory" "$dotfileDirectory"/"$fileName" && echo "Moved \"$fileName\" to "$dotfileDirectory""
        fi
        ln -sf "$PWD"/"$dotfileDirectory"/"$fileName" "$expandedDirectory" && echo "Created/updated symlink at "$expandedDirectory""
    fi
done
