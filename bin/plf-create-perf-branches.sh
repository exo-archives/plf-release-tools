#!/bin/bash -eu 

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh


COMMIT_MSG="[SWF-578] Create perf branch from 3.0.1"

# -----------------------------------------------------------------------------
RELEASE_KERNEL_VERSION=2.2.5-GA
NEXT_SNAPSHOT_KERNEL_VERSION=2.2.6-GA-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_CORE_VERSION=2.3.5-GA
NEXT_SNAPSHOT_CORE_VERSION=2.3.6-GA-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_WS_VERSION=2.1.5-GA
NEXT_SNAPSHOT_WS_VERSION=2.1.6-GA-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_JCR_VERSION=1.12.5-GA
NEXT_SNAPSHOT_JCR_VERSION=1.12.6-GA-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_GATEIN_VERSION=3.1.5-PLF
NEXT_SNAPSHOT_GATEIN_VERSION=3.1.6-PLF-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_ECMS_VERSION=2.1.1
NEXT_SNAPSHOT_ECMS_VERSION=2.1.2-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_SOCIAL_VERSION=1.1.1
NEXT_SNAPSHOT_SOCIAL_VERSION=1.1.2-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_CS_VERSION=2.1.1
NEXT_SNAPSHOT_CS_VERSION=2.1.2-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_KS_VERSION=2.1.1
NEXT_SNAPSHOT_KS_VERSION=2.1.2-PERF-SNAPSHOT
# -----------------------------------------------------------------------------
RELEASE_PLF_VERSION=3.0.1
NEXT_SNAPSHOT_PLF_VERSION=3.0.2-PERF-SNAPSHOT
# -----------------------------------------------------------------------------


# Update deps to next SNAPSHOTs in project $1
function updateDeps {
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.kernel.version>$RELEASE_KERNEL_VERSION</org.exoplatform.kernel.version>"              "<org.exoplatform.kernel.version>$NEXT_SNAPSHOT_KERNEL_VERSION</org.exoplatform.kernel.version>"                    $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.core.version>$RELEASE_CORE_VERSION</org.exoplatform.core.version>"                    "<org.exoplatform.core.version>$NEXT_SNAPSHOT_CORE_VERSION</org.exoplatform.core.version>"                          $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.ws.version>$RELEASE_WS_VERSION</org.exoplatform.ws.version>"                          "<org.exoplatform.ws.version>$NEXT_SNAPSHOT_WS_VERSION</org.exoplatform.ws.version>"                                $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.jcr.version>$RELEASE_JCR_VERSION</org.exoplatform.jcr.version>"                       "<org.exoplatform.jcr.version>$NEXT_SNAPSHOT_JCR_VERSION</org.exoplatform.jcr.version>"                             $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.portal.version>$RELEASE_GATEIN_VERSION</org.exoplatform.portal.version>"              "<org.exoplatform.portal.version>$NEXT_SNAPSHOT_GATEIN_VERSION</org.exoplatform.portal.version>"                    $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.gatein.version>$RELEASE_GATEIN_VERSION</org.exoplatform.gatein.version>"              "<org.exoplatform.gatein.version>$NEXT_SNAPSHOT_GATEIN_VERSION</org.exoplatform.gatein.version>"                    $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.cs.version>$RELEASE_CS_VERSION</org.exoplatform.cs.version>"                          "<org.exoplatform.cs.version>$NEXT_SNAPSHOT_CS_VERSION</org.exoplatform.cs.version>"                                $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.ks.version>$RELEASE_KS_VERSION</org.exoplatform.ks.version>"                          "<org.exoplatform.ks.version>$NEXT_SNAPSHOT_KS_VERSION</org.exoplatform.ks.version>"                                $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.ecms.version>$RELEASE_ECMS_VERSION</org.exoplatform.ecms.version>"                    "<org.exoplatform.ecms.version>$NEXT_SNAPSHOT_ECMS_VERSION</org.exoplatform.ecms.version>"                          $PRJ_DIR/$1
  ${SCRIPTS_DIR}/replace-in-poms.sh "<org.exoplatform.social.version>$RELEASE_SOCIAL_VERSION</org.exoplatform.social.version>"              "<org.exoplatform.social.version>$NEXT_SNAPSHOT_SOCIAL_VERSION</org.exoplatform.social.version>"                    $PRJ_DIR/$1
}


echo "==============================================================================="  
echo "Checkout from GIT"
echo "==============================================================================="  

gitCommand kernel-$RELEASE_KERNEL_VERSION-perf        clone    git@github.com:exoplatform/kernel.git
gitCommand kernel-$RELEASE_KERNEL_VERSION-perf        checkout -b $RELEASE_KERNEL_VERSION-perf $RELEASE_KERNEL_VERSION
gitCommand core-$RELEASE_CORE_VERSION-perf            clone    git@github.com:exoplatform/core.git
gitCommand core-$RELEASE_CORE_VERSION-perf            checkout -b $RELEASE_CORE_VERSION-perf $RELEASE_CORE_VERSION
gitCommand ws-$RELEASE_WS_VERSION-perf                clone    git@github.com:exoplatform/ws.git
gitCommand ws-$RELEASE_WS_VERSION-perf                checkout -b $RELEASE_WS_VERSION-perf $RELEASE_WS_VERSION
gitCommand jcr-$RELEASE_JCR_VERSION-perf              clone    git@github.com:exoplatform/jcr.git
gitCommand jcr-$RELEASE_JCR_VERSION-perf              checkout -b $RELEASE_JCR_VERSION-perf $RELEASE_JCR_VERSION
gitCommand exogtn-$RELEASE_GATEIN_VERSION-perf        clone    git@github.com:exoplatform/exogtn.git
gitCommand exogtn-$RELEASE_GATEIN_VERSION-perf        checkout -b $RELEASE_GATEIN_VERSION-perf $RELEASE_GATEIN_VERSION
gitCommand social-$RELEASE_SOCIAL_VERSION-perf        clone    git@github.com:exoplatform/social.git
gitCommand social-$RELEASE_SOCIAL_VERSION-perf        checkout -b $RELEASE_SOCIAL_VERSION-perf $RELEASE_SOCIAL_VERSION
gitCommand ecms-$RELEASE_ECMS_VERSION-perf            clone    git@github.com:exoplatform/ecms.git
gitCommand ecms-$RELEASE_ECMS_VERSION-perf            checkout -b $RELEASE_ECMS_VERSION-perf $RELEASE_ECMS_VERSION
gitCommand cs-$RELEASE_CS_VERSION-perf                clone    git@github.com:exoplatform/cs.git
gitCommand cs-$RELEASE_CS_VERSION-perf                checkout -b $RELEASE_CS_VERSION-perf $RELEASE_CS_VERSION
gitCommand ks-$RELEASE_KS_VERSION-perf                clone    git@github.com:exoplatform/ks.git
gitCommand ks-$RELEASE_KS_VERSION-perf                checkout -b $RELEASE_KS_VERSION-perf $RELEASE_KS_VERSION
gitCommand platform-$RELEASE_PLF_VERSION-perf         clone    git@github.com:exoplatform/platform.git
gitCommand platform-$RELEASE_PLF_VERSION-perf         checkout -b $RELEASE_PLF_VERSION-perf $RELEASE_PLF_VERSION

echo "==============================================================================="  
echo "Update Maven versions"
echo "==============================================================================="  

mvnCommand kernel-$RELEASE_KERNEL_VERSION-perf org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_KERNEL_VERSION
mvnCommand core-$RELEASE_CORE_VERSION-perf   org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_CORE_VERSION
mvnCommand ws-$RELEASE_WS_VERSION-perf     org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_WS_VERSION
mvnCommand jcr-$RELEASE_JCR_VERSION-perf    org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_JCR_VERSION
mvnCommand exogtn-$RELEASE_GATEIN_VERSION-perf org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_GATEIN_VERSION
mvnCommand social-$RELEASE_SOCIAL_VERSION-perf org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_SOCIAL_VERSION
mvnCommand ecms-$RELEASE_ECMS_VERSION-perf   org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_ECMS_VERSION
mvnCommand cs-$RELEASE_CS_VERSION-perf     org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_CS_VERSION
mvnCommand ks-$RELEASE_KS_VERSION-perf     org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_KS_VERSION
mvnCommand platform-$RELEASE_PLF_VERSION-perf    org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_PLF_VERSION
  
updateDeps kernel-$RELEASE_KERNEL_VERSION-perf
updateDeps core-$RELEASE_CORE_VERSION-perf
updateDeps ws-$RELEASE_WS_VERSION-perf
updateDeps jcr-$RELEASE_JCR_VERSION-perf
updateDeps exogtn-$RELEASE_GATEIN_VERSION-perf
updateDeps social-$RELEASE_SOCIAL_VERSION-perf
updateDeps ecms-$RELEASE_ECMS_VERSION-perf
updateDeps cs-$RELEASE_CS_VERSION-perf
updateDeps ks-$RELEASE_KS_VERSION-perf
updateDeps platform-$RELEASE_PLF_VERSION-perf

echo "==============================================================================="  
echo "Commit changes"
echo "==============================================================================="  

gitCommand kernel-$RELEASE_KERNEL_VERSION-perf    diff
gitCommand core-$RELEASE_CORE_VERSION-perf        diff
gitCommand ws-$RELEASE_WS_VERSION-perf            diff
gitCommand jcr-$RELEASE_JCR_VERSION-perf          diff
gitCommand exogtn-$RELEASE_GATEIN_VERSION-perf    diff
gitCommand social-$RELEASE_SOCIAL_VERSION-perf    diff  
gitCommand ecms-$RELEASE_ECMS_VERSION-perf        diff  
gitCommand cs-$RELEASE_CS_VERSION-perf            diff  
gitCommand ks-$RELEASE_KS_VERSION-perf            diff  
gitCommand platform-$RELEASE_PLF_VERSION-perf     diff  

gitCommand kernel-$RELEASE_KERNEL_VERSION-perf    commit  -m "$COMMIT_MSG"
gitCommand core-$RELEASE_CORE_VERSION-perf        commit  -m "$COMMIT_MSG"
gitCommand ws-$RELEASE_WS_VERSION-perf            commit  -m "$COMMIT_MSG"
gitCommand jcr-$RELEASE_JCR_VERSION-perf          commit  -m "$COMMIT_MSG"
gitCommand exogtn-$RELEASE_GATEIN_VERSION-perf    commit  -m "$COMMIT_MSG"
gitCommand social-$RELEASE_SOCIAL_VERSION-perf    commit  -m "$COMMIT_MSG"
gitCommand ecms-$RELEASE_ECMS_VERSION-perf        commit  -m "$COMMIT_MSG"
gitCommand cs-$RELEASE_CS_VERSION-perf            commit  -m "$COMMIT_MSG"
gitCommand ks-$RELEASE_KS_VERSION-perf            commit  -m "$COMMIT_MSG"
gitCommand platform-$RELEASE_PLF_VERSION-perf     commit  -m "$COMMIT_MSG"
