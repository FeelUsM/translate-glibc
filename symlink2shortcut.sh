#! /bin/bash
mklink(){
	[ ! -L "$1" ] && return
	echo "$1"
	[ -f "$1.lnk" ] && return
	sympath="$(symlinkpath "$1")"
	while [ $sympath != ${sympath#../} ] ; do
		sympath=${sympath#../}
	done
	# echo $sympath
	nircmd shortcut "$(cygpath -w "$(pwd)/$sympath")" "$(dirname "$1" | sed 's/\//\\/g')" "$(basename "$1")"
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
