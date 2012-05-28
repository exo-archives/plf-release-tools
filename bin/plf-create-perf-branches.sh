#!/bin/bash

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

# Executes svn copy $1 to $2
function svnCopy {
  echo "SVN Copy $1 -> $2"
  svn copy "$@" --non-interactive --trust-server-cert
  echo "Done."
  echo "==============================================================================="  
}

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
echo "Create all branches"
echo "==============================================================================="  

svnCopy https://svn.jboss.org/repos/exo-jcr/kernel/tags/$RELEASE_KERNEL_VERSION/     https://svn.jboss.org/repos/exo-jcr/kernel/branches/$RELEASE_KERNEL_VERSION-perf/    $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCopy https://svn.jboss.org/repos/exo-jcr/core/tags/$RELEASE_CORE_VERSION/         https://svn.jboss.org/repos/exo-jcr/core/branches/$RELEASE_CORE_VERSION-perf/        $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCopy https://svn.jboss.org/repos/exo-jcr/ws/tags/$RELEASE_WS_VERSION/             https://svn.jboss.org/repos/exo-jcr/ws/branches/$RELEASE_WS_VERSION-perf/            $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCopy https://svn.jboss.org/repos/exo-jcr/jcr/tags/$RELEASE_JCR_VERSION/           https://svn.jboss.org/repos/exo-jcr/jcr/branches/$RELEASE_JCR_VERSION-perf/          $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCopy https://svn.jboss.org/repos/gatein/exo/portal/tags/$RELEASE_GATEIN_VERSION/  https://svn.jboss.org/repos/gatein/exo/portal/branches/$RELEASE_GATEIN_VERSION-perf/ $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCopy http://svn.exoplatform.org/projects/social/tags/$RELEASE_SOCIAL_VERSION/     http://svn.exoplatform.org/projects/social/branches/$RELEASE_SOCIAL_VERSION-perf/    $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCopy http://svn.exoplatform.org/projects/ecms/tags/$RELEASE_ECMS_VERSION/         http://svn.exoplatform.org/projects/ecms/branches/$RELEASE_ECMS_VERSION-perf/        $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCopy http://svn.exoplatform.org/projects/cs/tags/$RELEASE_CS_VERSION/             http://svn.exoplatform.org/projects/cs/branches/$RELEASE_CS_VERSION-perf/            $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCopy http://svn.exoplatform.org/projects/ks/tags/$RELEASE_KS_VERSION/             http://svn.exoplatform.org/projects/ks/branches/$RELEASE_KS_VERSION-perf/            $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCopy http://svn.exoplatform.org/projects/platform/tags/$RELEASE_PLF_VERSION/      http://svn.exoplatform.org/projects/platform/branches/$RELEASE_PLF_VERSION-perf/     $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"

echo "==============================================================================="  
echo "Checkout from SVN"
echo "==============================================================================="  

svnCommand kernel-$RELEASE_KERNEL_VERSION-perf        checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/kernel/branches/$RELEASE_KERNEL_VERSION-perf/
svnCommand core-$RELEASE_CORE_VERSION-perf          checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/core/branches/$RELEASE_CORE_VERSION-perf/
svnCommand ws-$RELEASE_WS_VERSION-perf            checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/ws/branches/$RELEASE_WS_VERSION-perf/
svnCommand jcr-$RELEASE_JCR_VERSION-perf           checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/exo-jcr/jcr/branches/$RELEASE_JCR_VERSION-perf/
svnCommand gatein-$RELEASE_GATEIN_VERSION-perf        checkout --force $SVN_JBOSS_CREDENTIALS  https://svn.jboss.org/repos/gatein/exo/portal/branches/$RELEASE_GATEIN_VERSION-perf/
svnCommand social-$RELEASE_SOCIAL_VERSION-perf        checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/social/branches/$RELEASE_SOCIAL_VERSION-perf/
svnCommand ecms-$RELEASE_ECMS_VERSION-perf          checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/ecms/branches/$RELEASE_ECMS_VERSION-perf/
svnCommand cs-$RELEASE_CS_VERSION-perf            checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/cs/branches/$RELEASE_CS_VERSION-perf/
svnCommand ks-$RELEASE_KS_VERSION-perf            checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/ks/branches/$RELEASE_KS_VERSION-perf/
svnCommand plf-$RELEASE_PLF_VERSION-perf           checkout --force $SVN_EXO_CREDENTIALS    http://svn.exoplatform.org/projects/platform/branches/$RELEASE_PLF_VERSION-perf/

echo "==============================================================================="  
echo "Update Maven versions"
echo "==============================================================================="  

mvnCommand kernel-$RELEASE_KERNEL_VERSION-perf org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_KERNEL_VERSION
mvnCommand core-$RELEASE_CORE_VERSION-perf   org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_CORE_VERSION
mvnCommand ws-$RELEASE_WS_VERSION-perf     org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_WS_VERSION
mvnCommand jcr-$RELEASE_JCR_VERSION-perf    org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_JCR_VERSION
mvnCommand gatein-$RELEASE_GATEIN_VERSION-perf org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_GATEIN_VERSION
mvnCommand social-$RELEASE_SOCIAL_VERSION-perf org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_SOCIAL_VERSION
mvnCommand ecms-$RELEASE_ECMS_VERSION-perf   org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_ECMS_VERSION
mvnCommand cs-$RELEASE_CS_VERSION-perf     org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_CS_VERSION
mvnCommand ks-$RELEASE_KS_VERSION-perf     org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_KS_VERSION
mvnCommand plf-$RELEASE_PLF_VERSION-perf    org.codehaus.mojo:versions-maven-plugin:1.2:set -DnewVersion=$NEXT_SNAPSHOT_PLF_VERSION
  
updateDeps kernel-$RELEASE_KERNEL_VERSION-perf
updateDeps core-$RELEASE_CORE_VERSION-perf
updateDeps ws-$RELEASE_WS_VERSION-perf
updateDeps jcr-$RELEASE_JCR_VERSION-perf
updateDeps gatein-$RELEASE_GATEIN_VERSION-perf
updateDeps social-$RELEASE_SOCIAL_VERSION-perf
updateDeps ecms-$RELEASE_ECMS_VERSION-perf
updateDeps cs-$RELEASE_CS_VERSION-perf
updateDeps ks-$RELEASE_KS_VERSION-perf
updateDeps plf-$RELEASE_PLF_VERSION-perf

echo "==============================================================================="  
echo "Commit changes"
echo "==============================================================================="  

svnCommand kernel-$RELEASE_KERNEL_VERSION-perf    diff $SVN_JBOSS_CREDENTIALS
svnCommand core-$RELEASE_CORE_VERSION-perf        diff $SVN_JBOSS_CREDENTIALS
svnCommand ws-$RELEASE_WS_VERSION-perf            diff $SVN_JBOSS_CREDENTIALS
svnCommand jcr-$RELEASE_JCR_VERSION-perf          diff $SVN_JBOSS_CREDENTIALS
svnCommand gatein-$RELEASE_GATEIN_VERSION-perf    diff $SVN_JBOSS_CREDENTIALS
svnCommand social-$RELEASE_SOCIAL_VERSION-perf    diff $SVN_EXO_CREDENTIALS  
svnCommand ecms-$RELEASE_ECMS_VERSION-perf        diff $SVN_EXO_CREDENTIALS  
svnCommand cs-$RELEASE_CS_VERSION-perf            diff $SVN_EXO_CREDENTIALS  
svnCommand ks-$RELEASE_KS_VERSION-perf            diff $SVN_EXO_CREDENTIALS  
svnCommand plf-$RELEASE_PLF_VERSION-perf          diff $SVN_EXO_CREDENTIALS  

svnCommand kernel-$RELEASE_KERNEL_VERSION-perf    commit $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCommand core-$RELEASE_CORE_VERSION-perf        commit $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCommand ws-$RELEASE_WS_VERSION-perf            commit $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCommand jcr-$RELEASE_JCR_VERSION-perf          commit $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCommand gatein-$RELEASE_GATEIN_VERSION-perf    commit $SVN_JBOSS_CREDENTIALS -m"$COMMIT_MSG"
svnCommand social-$RELEASE_SOCIAL_VERSION-perf    commit $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCommand ecms-$RELEASE_ECMS_VERSION-perf        commit $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCommand cs-$RELEASE_CS_VERSION-perf            commit $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCommand ks-$RELEASE_KS_VERSION-perf            commit $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
svnCommand plf-$RELEASE_PLF_VERSION-perf          commit $SVN_EXO_CREDENTIALS   -m"$COMMIT_MSG"
