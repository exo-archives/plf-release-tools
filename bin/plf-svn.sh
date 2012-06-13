#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

COMMAND=$1
shift

echo "==============================================================================="  
echo "Executing SVN $COMMAND on all platform 3.0.x projects"
echo "==============================================================================="  

svnCommand kernel-2.2.x        $COMMAND $SVN_JBOSS_CREDENTIALS  "$@"
svnCommand core-2.3.x          $COMMAND $SVN_JBOSS_CREDENTIALS  "$@" 
svnCommand ws-2.1.x            $COMMAND $SVN_JBOSS_CREDENTIALS  "$@" 
svnCommand jcr-1.12.x          $COMMAND $SVN_JBOSS_CREDENTIALS  "$@" 
svnCommand gatein-3.1.x        $COMMAND $SVN_JBOSS_CREDENTIALS  "$@" 
svnCommand xcmis-1.1.x         $COMMAND $SVN_GOOGLE_CREDENTIALS "$@" 
svnCommand jcr-services-1.12.x $COMMAND $SVN_EXO_CREDENTIALS    "$@"
svnCommand gwt-fwk-1.0.x       $COMMAND $SVN_EXO_CREDENTIALS    "$@" 
svnCommand ide-1.0.x           $COMMAND $SVN_EXO_CREDENTIALS    "$@" 
svnCommand commons-1.0.x       $COMMAND $SVN_EXO_CREDENTIALS    "$@" 
svnCommand ecms-2.1.x          $COMMAND $SVN_EXO_CREDENTIALS    "$@" 
svnCommand social-1.1.x        $COMMAND $SVN_EXO_CREDENTIALS    "$@" 
svnCommand cs-2.1.x            $COMMAND $SVN_EXO_CREDENTIALS    "$@" 
svnCommand ks-2.1.x            $COMMAND $SVN_EXO_CREDENTIALS    "$@" 
svnCommand plf-3.0.x           $COMMAND $SVN_EXO_CREDENTIALS    "$@"
