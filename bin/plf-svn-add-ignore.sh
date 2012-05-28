#!/bin/bash

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

echo "==============================================================================="  
echo "Add svn:ignore properties in all maven modules of platform 3.0.x projects"
echo "==============================================================================="  

find $PRJ_DIR -name pom.xml -not -path "*/target/*" -exec dirname {} \; | xargs svn ps svn:ignore -F $CONFIG_DIR/subversion/svn-ignore --force
