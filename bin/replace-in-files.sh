#!/bin/bash -eu
SEP="`echo | tr '\n' '\001'`"

if [ $# -lt 3 ]; then
 echo "Usage: $0 oldvalue newvalue filename [wheretofind]"
 exit
fi;

if [ $# -eq 3 ]; then
	find . -name "$3" -type f -exec sed -i "s${SEP}$1${SEP}$2${SEP}g" {} \;
else
	find "$4" -name "$3" -type f -exec sed -i "s${SEP}$1${SEP}$2${SEP}g" {} \;
fi
