#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

# -----------------------------------------------------------------------------
RELEASE_KERNEL_BRANCH=stable/2.2.x
# -----------------------------------------------------------------------------
RELEASE_CORE_BRANCH=stable/2.3.x
# -----------------------------------------------------------------------------
RELEASE_WS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_JCR_BRANCH=stable/1.12.x
# -----------------------------------------------------------------------------
RELEASE_JCR_SERVICES_BRANCH=stable/1.12.x
# -----------------------------------------------------------------------------
RELEASE_EXOGTN_BRANCH=stable/3.1.x
# -----------------------------------------------------------------------------
RELEASE_GWTFRAMEWORK_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_IDE_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_COMMONS_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_ECMS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_SOCIAL_BRANCH=stable/1.1.x
# -----------------------------------------------------------------------------
RELEASE_CS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_KS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_PLATFORM_BRANCH=stable/3.0.x
# -----------------------------------------------------------------------------

rm -rf $PRJ_DIR/*

echo "==============================================================================="  
echo "Clone from GitHub all platform projects"
echo "==============================================================================="  

gitCommand kernel        clone    git@github.com:exoplatform/kernel.git
gitCommand kernel        pull     origin
gitCommand kernel        checkout -b $RELEASE_KERNEL_BRANCH remotes/origin/$RELEASE_KERNEL_BRANCH
gitCommand core          clone    git@github.com:exoplatform/core.git
gitCommand core          pull     origin
gitCommand core          checkout -b $RELEASE_CORE_BRANCH remotes/origin/$RELEASE_CORE_BRANCH
gitCommand ws            clone    git@github.com:exoplatform/ws.git
gitCommand ws            pull     origin
gitCommand ws            checkout -b $RELEASE_WS_BRANCH remotes/origin/$RELEASE_WS_BRANCH
gitCommand jcr           clone    git@github.com:exoplatform/jcr.git
gitCommand jcr           pull     origin
gitCommand jcr           checkout -b $RELEASE_JCR_BRANCH remotes/origin/$RELEASE_JCR_BRANCH
gitCommand jcr-services  clone    git@github.com:exoplatform/jcr-services.git
gitCommand jcr-services  pull     origin
gitCommand jcr-services  checkout -b $RELEASE_JCR_SERVICES_BRANCH remotes/origin/$RELEASE_JCR_SERVICES_BRANCH
gitCommand exogtn        clone    git@github.com:exoplatform/exogtn.git
gitCommand exogtn        pull     origin
gitCommand exogtn        checkout -b $RELEASE_EXOGTN_BRANCH remotes/origin/$RELEASE_EXOGTN_BRANCH
#svnCommand xcmis-1.1.x         checkout --force $SVN_GOOGLE_CREDENTIALS https://xcmis.googlecode.com/svn/branches/1.1.x/
gitCommand gwtframework  clone    git@github.com:exoplatform/gwtframework.git
gitCommand gwtframework  pull     origin
gitCommand gwtframework  checkout -b $RELEASE_GWTFRAMEWORK_BRANCH remotes/origin/$RELEASE_GWTFRAMEWORK_BRANCH
gitCommand ide           clone    git@github.com:exoplatform/ide.git
gitCommand ide           pull     origin
gitCommand ide           checkout -b $RELEASE_IDE_BRANCH remotes/origin/$RELEASE_IDE_BRANCH
gitCommand commons       clone    git@github.com:exoplatform/commons.git
gitCommand commons       pull     origin
gitCommand commons       checkout -b $RELEASE_COMMONS_BRANCH remotes/origin/$RELEASE_COMMONS_BRANCH
gitCommand ecms          clone    git@github.com:exoplatform/ecms.git
gitCommand ecms          pull     origin
gitCommand ecms          checkout -b $RELEASE_ECMS_BRANCH remotes/origin/$RELEASE_ECMS_BRANCH
gitCommand social        clone    git@github.com:exoplatform/social.git
gitCommand social        pull     origin
gitCommand social        checkout -b $RELEASE_SOCIAL_BRANCH remotes/origin/$RELEASE_SOCIAL_BRANCH
gitCommand cs            clone    git@github.com:exoplatform/cs.git
gitCommand cs            pull     origin
gitCommand cs            checkout -b $RELEASE_CS_BRANCH remotes/origin/$RELEASE_CS_BRANCH
gitCommand ks            clone    git@github.com:exoplatform/ks.git
gitCommand ks            pull     origin
gitCommand ks            checkout -b $RELEASE_KS_BRANCH remotes/origin/$RELEASE_KS_BRANCH
gitCommand platform      clone    git@github.com:exoplatform/platform.git
gitCommand platform      pull    origin
gitCommand platform      checkout -b $RELEASE_PLATFORM_BRANCH remotes/origin/$RELEASE_PLATFORM_BRANCH
