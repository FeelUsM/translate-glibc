#! /bin/bash

NUM=0
for file in ru/* ; do
    #echo do: $file
    if [ $(grep '<h[1-9]' "$file" | wc -l) != 1 ]; then
		NUM=$(($NUM + 1))
		echo error\($NUM\): $file
		continue
    fi
    DIR="$(grep '<h[1-9]' "$file" | sed 's/^[^>]*>//; s/ .*$//; s/\./\//g')"
	prefix=$(basename "$DIR")
	DIR=$(dirname "$DIR")
    mkdir -p translate-progress/"$DIR"
	ln -sr "$file" translate-progress/"$DIR"/"$prefix-$(basename "$file")"
done
