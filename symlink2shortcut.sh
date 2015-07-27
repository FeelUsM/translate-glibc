#! /bin/bash
mklink(){
	[ ! -L "$1" ] && return
	echo "$1"
	[ -f "$1.lnk" ] && return
	nircmd shortcut "$(cygpath -w "$(pwd)/$(symlinkpath "$1")")" "$(dirname "$1" | sed 's/\//\\/g')" "$(basename "$1")"
}

for f in translate-progress/* ; do
	mklink "$f"
done
for f in translate-progress/*/* ; do
	mklink "$f"
done
for f in translate-progress/*/*/* ; do
	mklink "$f"
done
for f in translate-progress/*/*/*/* ; do
	mklink "$f"
done
for f in translate-progress/*/*/*/*/* ; do
	mklink "$f"
done
for f in translate-progress/*/*/*/*/*/* ; do
	mklink "$f"
done
