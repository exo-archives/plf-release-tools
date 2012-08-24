#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

COMMAND=$1
shift

echo "==============================================================================="  
echo "Executing GIT $COMMAND on all platform 3.0.x projects"
echo "==============================================================================="  

gitCommand kernel        $COMMAND   "$@"
gitCommand core          $COMMAND   "$@"
gitCommand ws            $COMMAND   "$@"
gitCommand jcr           $COMMAND   "$@"
gitCommand jcr-services  $COMMAND   "$@"
gitCommand exogtn        $COMMAND   "$@"
#svnCommand xcmis-1.1.x         $COMMAND $SVN_GOOGLE_CREDENTIALS "$@"
gitCommand gwtframework  $COMMAND   "$@"
gitCommand ide           $COMMAND   "$@"
gitCommand commons       $COMMAND   "$@"
gitCommand ecms          $COMMAND   "$@"
gitCommand social        $COMMAND   "$@"
gitCommand cs            $COMMAND   "$@"
gitCommand ks            $COMMAND   "$@"
gitCommand platform      $COMMAND   "$@"
