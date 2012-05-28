#!/bin/bash

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

#rm -rf $PRJ_DIR/*

echo "==============================================================================="  
echo "Checkout from SVN all platform 3.0.x projects"
echo "==============================================================================="  

svnCommand kernel-2.2.x        checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/kernel/branches/2.2.x/
svnCommand core-2.3.x          checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/core/branches/2.3.x/
svnCommand ws-2.1.x            checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/ws/branches/2.1.x/
svnCommand jcr-1.12.x          checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/jcr/branches/1.12.x/
#svnCommand gatein-3.1.x        checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/gatein/exo/portal/branches/3.1.x/
#svnCommand xcmis-1.1.x         checkout --force $SVN_GOOGLE_CREDENTIALS https://xcmis.googlecode.com/svn/branches/1.1.x/       
svnCommand jcr-services-1.12.x checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/jcr-services/branches/1.12.x/
#svnCommand gwt-fwk-1.0.x       checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/gwt/branches/1.0.x/
svnCommand ide-1.0.x           checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/ide/branches/1.0.x/
svnCommand commons-1.0.x       checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/commons/branches/1.0.x/
svnCommand social-1.1.x        checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/social/branches/1.1.x/
svnCommand ecms-2.1.x          checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/ecms/branches/2.1.x/
svnCommand cs-2.1.x            checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/cs/branches/2.1.x/
svnCommand ks-2.1.x            checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/ks/branches/2.1.x/
svnCommand plf-3.0.x           checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/platform/branches/3.0.x/
