#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

echo "==============================================================================="  
echo "Execute maven on all projects of platform 3.0.x"
echo "==============================================================================="  

mvnCommand kernel-2.2.x        "$@"
mvnCommand core-2.3.x          "$@"
mvnCommand ws-2.1.x            "$@"
mvnCommand jcr-1.12.x          "$@"
mvnCommand jcr-services-1.12.x "$@"
mvnCommand gatein-3.1.x        "$@"
mvnCommand xcmis-1.1.x         "$@"
mvnCommand gwt-fwk-1.0.x       "$@"
mvnCommand ide-1.0.x        "$@"
mvnCommand commons-1.0.x       "$@"
mvnCommand ecms-2.1.x          "$@"
mvnCommand social-1.1.x        "$@"
mvnCommand cs-2.1.x            "$@"
mvnCommand ks-2.1.x            "$@"
mvnCommand plf-3.0.x           "$@"
