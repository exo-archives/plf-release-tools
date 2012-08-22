#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

#rm -rf $PRJ_DIR/*

echo "==============================================================================="  
echo "Clone from GitHub all platform 3.0.x projects"
echo "==============================================================================="  

gitCommand kernel-2.2.x        clone    git@github.com:exoplatform/kernel.git
gitCommand core-2.3.x          clone    git@github.com:exoplatform/core.git
gitCommand ws-2.1.x            clone    git@github.com:exoplatform/ws.git
gitCommand jcr-1.12.x          clone    git@github.com:exoplatform/jcr.git
#gitCommand gatein-3.1.x        clone    git@github.com:exoplatform/exogtn.git
#gitCommand xcmis-1.1.x         clone   https://xcmis.googlecode.com/svn/branches/1.1.x/       
gitCommand jcr-services-1.12.x clone      git@github.com:exoplatform/jcr-services.git
#gitCommand gwt-fwk-1.0.x       clone      git@github.com:exoplatform/gwtframework.git
gitCommand ide-1.0.x           clone      git@github.com:exoplatform/ide.git
gitCommand commons-1.0.x       clone      git@github.com:exoplatform/commons.git
gitCommand social-1.1.x        clone      git@github.com:exoplatform/social.git
gitCommand ecms-2.1.x          clone      git@github.com:exoplatform/ecms.git
gitCommand cs-2.1.x            clone      git@github.com:exoplatform/cs.git
gitCommand ks-2.1.x            clone      git@github.com:exoplatform/ks.git
gitCommand plf-3.0.x           clone      git@github.com:exoplatform/platform.git
