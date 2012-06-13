#!/bin/bash -eu 

if [ $# -lt 2 ]; then
 echo "Usage: $0 whattofind filename [wheretofind]"
 exit
fi;

if [ $# -eq 2 ]; then
	find . -name "$2" -type f -exec grep --with-filename "$1" \{\} \;
else
	find "$3" -name "$2" -type f -exec grep --with-filename "$1" \{\} \;
fi