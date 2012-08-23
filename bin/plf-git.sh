#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

COMMAND=$1
shift

echo "==============================================================================="  
echo "Executing GIT $COMMAND on all platform 3.0.x projects"
echo "==============================================================================="  

gitCommand kernel-2.2.x        $COMMAND   "$@"
gitCommand core-2.3.x          $COMMAND   "$@"
gitCommand ws-2.1.x            $COMMAND   "$@"
gitCommand jcr-1.12.x          $COMMAND   "$@"
gitCommand jcr-services-1.12.x $COMMAND   "$@"
gitCommand exogtn-3.1.x        $COMMAND   "$@"
#svnCommand xcmis-1.1.x         $COMMAND $SVN_GOOGLE_CREDENTIALS "$@"
gitCommand gwtframework-1.0.x  $COMMAND   "$@"
gitCommand ide-1.0.x           $COMMAND   "$@"
gitCommand commons-1.0.x       $COMMAND   "$@"
gitCommand ecms-2.1.x          $COMMAND   "$@"
gitCommand social-1.1.x        $COMMAND   "$@"
gitCommand cs-2.1.x            $COMMAND   "$@"
gitCommand ks-2.1.x            $COMMAND   "$@"
gitCommand platform-3.0.x      $COMMAND   "$@"
