#!/bin/bash -eu 

if [ $# -lt 2 ]; then
 echo "Usage: $0 oldvalue newvalue [wheretofind]"
 exit
fi;

if [ $# -eq 2 ]; then
    ${0%/*}/replace-in-files.sh "$1" "$2" "pom.xml"
else
    ${0%/*}/replace-in-files.sh "$1" "$2" "pom.xml" "$3"
fi