#!/bin/bash

if [ $# -lt 1 ]; then
 echo "Usage: $0 whattofind [wheretofind]"
 exit
fi;

if [ $# -eq 1 ]; then
    ${0%/*}/find-in-files.sh "$1" "pom.xml"
else
    ${0%/*}/find-in-files.sh "$1" "pom.xml" "$2"
fi