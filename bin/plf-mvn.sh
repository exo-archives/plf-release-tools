#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

echo "==============================================================================="  
echo "Execute maven on all projects of platform 3.0.x"
echo "==============================================================================="  

mvnCommand kernel        "$@"
mvnCommand core          "$@"
mvnCommand ws            "$@"
mvnCommand jcr           "$@"
mvnCommand jcr-services  "$@"
mvnCommand exogtn        "$@"
#mvnCommand xcmis-1.1.x         "$@"
mvnCommand gwtframework  "$@"
mvnCommand ide           "$@"
mvnCommand commons       "$@"
mvnCommand ecms          "$@"
mvnCommand social        "$@"
mvnCommand cs            "$@"
mvnCommand ks            "$@"
mvnCommand platform      "$@"
