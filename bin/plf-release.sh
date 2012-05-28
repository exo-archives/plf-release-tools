#!/bin/bash

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_KERNEL_VERSION=2.2.12-GA-SNAPSHOT
RELEASE_KERNEL_VERSION=2.2.12-GA
NEXT_SNAPSHOT_KERNEL_VERSION=2.2.13-GA-SNAPSHOT
RELEASE_KERNEL_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_CORE_VERSION=2.3.12-GA-SNAPSHOT
RELEASE_CORE_VERSION=2.3.12-GA
NEXT_SNAPSHOT_CORE_VERSION=2.3.13-GA-SNAPSHOT
RELEASE_CORE_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_WS_VERSION=2.1.12-GA-SNAPSHOT
RELEASE_WS_VERSION=2.1.12-GA
NEXT_SNAPSHOT_WS_VERSION=2.1.13-GA-SNAPSHOT
RELEASE_WS_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_JCR_VERSION=1.12.12-GA-SNAPSHOT
RELEASE_JCR_VERSION=1.12.12-GA
NEXT_SNAPSHOT_JCR_VERSION=1.12.13-GA-SNAPSHOT
RELEASE_JCR_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_JCR_SERVICES_VERSION=1.12.12-GA-SNAPSHOT
RELEASE_JCR_SERVICES_VERSION=1.12.12-GA
NEXT_SNAPSHOT_JCR_SERVICES_VERSION=1.12.13-GA-SNAPSHOT
RELEASE_JCR_SERVICES_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_GATEIN_VERSION=3.1.12-PLF-SNAPSHOT
RELEASE_GATEIN_VERSION=3.1.12-PLF
NEXT_SNAPSHOT_GATEIN_VERSION=3.1.13-PLF-SNAPSHOT
RELEASE_GATEIN_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_XCMIS_VERSION=1.2.2
RELEASE_XCMIS_VERSION=1.2.2
NEXT_SNAPSHOT_XCMIS_VERSION=1.2.2
RELEASE_XCMIS_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_GWTFWK_VERSION=1.0.6-SNAPSHOT
RELEASE_GWTFWK_VERSION=1.0.6
NEXT_SNAPSHOT_GWTFWK_VERSION=1.0.7
RELEASE_GWTFWK_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_IDE_VERSION=1.0.7-SNAPSHOT
RELEASE_IDE_VERSION=1.0.7
NEXT_SNAPSHOT_IDE_VERSION=1.0.8
RELEASE_IDE_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_COMMONS_VERSION=1.0.8-SNAPSHOT
RELEASE_COMMONS_VERSION=1.0.8
NEXT_SNAPSHOT_COMMONS_VERSION=1.0.9-SNAPSHOT
RELEASE_COMMONS_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_ECMS_VERSION=2.1.8-SNAPSHOT
RELEASE_ECMS_VERSION=2.1.8
NEXT_SNAPSHOT_ECMS_VERSION=2.1.9-SNAPSHOT
RELEASE_ECMS_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_SOCIAL_VERSION=1.1.8-SNAPSHOT
RELEASE_SOCIAL_VERSION=1.1.8
NEXT_SNAPSHOT_SOCIAL_VERSION=1.1.9-SNAPSHOT
RELEASE_SOCIAL_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_CS_VERSION=2.1.8-SNAPSHOT
RELEASE_CS_VERSION=2.1.8
NEXT_SNAPSHOT_CS_VERSION=2.1.9-SNAPSHOT
RELEASE_CS_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_KS_VERSION=2.1.8-SNAPSHOT
RELEASE_KS_VERSION=2.1.8
NEXT_SNAPSHOT_KS_VERSION=2.1.9-SNAPSHOT
RELEASE_KS_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_PLF_VERSION=3.0.8-SNAPSHOT
RELEASE_PLF_VERSION=3.0.8
NEXT_SNAPSHOT_PLF_VERSION=3.0.9-SNAPSHOT
RELEASE_PLF_JIRA_ID=PLF-2955
# -----------------------------------------------------------------------------

function init {
  case $1 in
  "kernel-2.2.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_JBOSS_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_JBOSS_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_KERNEL_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_KERNEL_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_KERNEL_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_KERNEL_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "core-2.3.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_JBOSS_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_JBOSS_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_CORE_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_CORE_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_CORE_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_CORE_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "ws-2.1.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_JBOSS_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_JBOSS_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_WS_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_WS_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_WS_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_WS_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "jcr-1.12.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_JBOSS_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_JBOSS_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_JCR_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_JCR_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_JCR_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_JCR_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "jcr-services-1.12.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_JCR_SERVICES_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_JCR_SERVICES_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_JCR_SERVICES_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_JCR_SERVICES_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "gatein-3.1.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_JBOSS_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_JBOSS_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_GATEIN_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_GATEIN_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_GATEIN_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_GATEIN_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "xcmis-1.1.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_GOOGLE_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_GOOGLE_CREDENTIALS"    
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_XCMIS_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_XCMIS_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_XCMIS_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_XCMIS_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "gwt-fwk-1.0.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_GWTFWK_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_GWTFWK_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_GWTFWK_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_GWTFWK_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "ide-1.0.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_IDE_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_IDE_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_IDE_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_IDE_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "commons-1.0.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_COMMONS_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_COMMONS_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_COMMONS_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_COMMONS_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "ecms-2.1.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_ECMS_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_ECMS_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_ECMS_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_ECMS_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS="-Pwcm,wkf,dms,docs"
    return;
    ;;
  "social-1.1.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_SOCIAL_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_SOCIAL_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_SOCIAL_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_SOCIAL_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "cs-2.1.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_CS_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_CS_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_CS_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_CS_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "ks-2.1.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_KS_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_KS_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_KS_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_KS_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  "plf-3.0.x")
    THIS_PROJECT="$1"
    THIS_SVN_CREDENTIALS="$SVN_EXO_CREDENTIALS"
    THIS_MVN_CREDENTIALS="$MVN_EXO_CREDENTIALS"
    THIS_CURRENT_SNAPSHOT_VERSION="$CURRENT_SNAPSHOT_PLF_VERSION"
    THIS_RELEASE_VERSION="$RELEASE_PLF_VERSION"
    THIS_NEXT_SNAPSHOT_VERSION="$NEXT_SNAPSHOT_PLF_VERSION"
    THIS_RELEASE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
    THIS_RELEASE_ADDITIONAL_OPTS=""
    return;
    ;;
  *)
    echo "It is required to specify the project to release";
    exit;
    ;;
  esac
}

function replaceInFile {
  sed -i "s${SEP}$1${SEP}$2${SEP}g" "$3"
}

function checkVersions {
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.kernel.version>"        $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.core.version>"          $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.ws.version>"            $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.jcr.version>"           $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.jcr-services.version>"  $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.portal.version>"        $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.gatein.version>"        $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.xcmis.version>"                     $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<xcmis.version>"                         $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.ide.version>"           $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.gwtframework.version>"  $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.commons.version>"       $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.cs.version>"            $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.ks.version>"            $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.ecms.version>"          $PRJ_DIR/$1
  echo "==============================================================================="  
  ${SCRIPTS_DIR}/find-in-poms.sh "<org.exoplatform.social.version>"        $PRJ_DIR/$1
  echo "==============================================================================="  

}

function beforeRelease {
  replaceInFile "<org.exoplatform.kernel.version>$CURRENT_SNAPSHOT_KERNEL_VERSION</org.exoplatform.kernel.version>"                    "<org.exoplatform.kernel.version>$RELEASE_KERNEL_VERSION</org.exoplatform.kernel.version>"                    $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.core.version>$CURRENT_SNAPSHOT_CORE_VERSION</org.exoplatform.core.version>"                          "<org.exoplatform.core.version>$RELEASE_CORE_VERSION</org.exoplatform.core.version>"                          $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ws.version>$CURRENT_SNAPSHOT_WS_VERSION</org.exoplatform.ws.version>"                                "<org.exoplatform.ws.version>$RELEASE_WS_VERSION</org.exoplatform.ws.version>"                                $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.jcr.version>$CURRENT_SNAPSHOT_JCR_VERSION</org.exoplatform.jcr.version>"                             "<org.exoplatform.jcr.version>$RELEASE_JCR_VERSION</org.exoplatform.jcr.version>"                             $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.jcr-services.version>$CURRENT_SNAPSHOT_JCR_SERVICES_VERSION</org.exoplatform.jcr-services.version>"  "<org.exoplatform.jcr-services.version>$RELEASE_JCR_SERVICES_VERSION</org.exoplatform.jcr-services.version>"  $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.portal.version>$CURRENT_SNAPSHOT_GATEIN_VERSION</org.exoplatform.portal.version>"                    "<org.exoplatform.portal.version>$RELEASE_GATEIN_VERSION</org.exoplatform.portal.version>"                    $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.gatein.version>$CURRENT_SNAPSHOT_GATEIN_VERSION</org.exoplatform.gatein.version>"                    "<org.exoplatform.gatein.version>$RELEASE_GATEIN_VERSION</org.exoplatform.gatein.version>"                    $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.xcmis.version>$CURRENT_SNAPSHOT_XCMIS_VERSION</org.xcmis.version>"                                               "<org.xcmis.version>$RELEASE_XCMIS_VERSION</org.xcmis.version>"                                               $PRJ_DIR/$1/pom.xml
  replaceInFile "<xcmis.version>$CURRENT_SNAPSHOT_XCMIS_VERSION</xcmis.version>"                                                       "<xcmis.version>$RELEASE_XCMIS_VERSION</xcmis.version>"                                                       $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ide.version>$CURRENT_SNAPSHOT_IDE_VERSION</org.exoplatform.ide.version>"                             "<org.exoplatform.ide.version>$RELEASE_IDE_VERSION</org.exoplatform.ide.version>"                             $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.gwtframework.version>$CURRENT_SNAPSHOT_GWTFWK_VERSION</org.exoplatform.gwtframework.version>"        "<org.exoplatform.gwtframework.version>$RELEASE_GWTFWK_VERSION</org.exoplatform.gwtframework.version>"        $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.commons.version>$CURRENT_SNAPSHOT_COMMONS_VERSION</org.exoplatform.commons.version>"                 "<org.exoplatform.commons.version>$RELEASE_COMMONS_VERSION</org.exoplatform.commons.version>"                 $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.cs.version>$CURRENT_SNAPSHOT_CS_VERSION</org.exoplatform.cs.version>"                                "<org.exoplatform.cs.version>$RELEASE_CS_VERSION</org.exoplatform.cs.version>"                                $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ks.version>$CURRENT_SNAPSHOT_KS_VERSION</org.exoplatform.ks.version>"                                "<org.exoplatform.ks.version>$RELEASE_KS_VERSION</org.exoplatform.ks.version>"                                $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ecms.version>$CURRENT_SNAPSHOT_ECMS_VERSION</org.exoplatform.ecms.version>"                          "<org.exoplatform.ecms.version>$RELEASE_ECMS_VERSION</org.exoplatform.ecms.version>"                          $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.social.version>$CURRENT_SNAPSHOT_SOCIAL_VERSION</org.exoplatform.social.version>"                    "<org.exoplatform.social.version>$RELEASE_SOCIAL_VERSION</org.exoplatform.social.version>"                    $PRJ_DIR/$1/pom.xml
}

function prepareRelease {
  mvnCommand $1 org.apache.maven.plugins:maven-release-plugin:2.0:prepare -Dtag=$THIS_RELEASE_VERSION -DreleaseVersion=$THIS_RELEASE_VERSION -DdevelopmentVersion=$THIS_NEXT_SNAPSHOT_VERSION -DscmCommentPrefix="[maven-release-plugin] [$THIS_RELEASE_JIRA_ID]" $THIS_MVN_CREDENTIALS $THIS_RELEASE_ADDITIONAL_OPTS
}

function rollbackRelease {
  mvnCommand $1 org.apache.maven.plugins:maven-release-plugin:2.0:rollback -DscmCommentPrefix="[maven-release-plugin] [$THIS_RELEASE_JIRA_ID]" $THIS_MVN_CREDENTIALS $THIS_RELEASE_ADDITIONAL_OPTS
}

function performRelease {
  mvnCommand $1 org.apache.maven.plugins:maven-release-plugin:2.0:perform
}

function createReleaseBranch {
  mvnCommand $1 org.apache.maven.plugins:maven-release-plugin:2.0:branch -DbranchName=${THIS_RELEASE_VERSION}_REL $THIS_MVN_CREDENTIALS $THIS_RELEASE_ADDITIONAL_OPTS
}

function afterRelease {
  svnCommand $1 revert -R
  mvnCommand $1 clean
  replaceInFile "<org.exoplatform.kernel.version>$RELEASE_KERNEL_VERSION</org.exoplatform.kernel.version>"                    "<org.exoplatform.kernel.version>$NEXT_SNAPSHOT_KERNEL_VERSION</org.exoplatform.kernel.version>"                    $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.core.version>$RELEASE_CORE_VERSION</org.exoplatform.core.version>"                          "<org.exoplatform.core.version>$NEXT_SNAPSHOT_CORE_VERSION</org.exoplatform.core.version>"                          $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ws.version>$RELEASE_WS_VERSION</org.exoplatform.ws.version>"                                "<org.exoplatform.ws.version>$NEXT_SNAPSHOT_WS_VERSION</org.exoplatform.ws.version>"                                $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.jcr.version>$RELEASE_JCR_VERSION</org.exoplatform.jcr.version>"                             "<org.exoplatform.jcr.version>$NEXT_SNAPSHOT_JCR_VERSION</org.exoplatform.jcr.version>"                             $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.jcr-services.version>$RELEASE_JCR_SERVICES_VERSION</org.exoplatform.jcr-services.version>"  "<org.exoplatform.jcr-services.version>$NEXT_SNAPSHOT_JCR_SERVICES_VERSION</org.exoplatform.jcr-services.version>"  $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.portal.version>$RELEASE_GATEIN_VERSION</org.exoplatform.portal.version>"                    "<org.exoplatform.portal.version>$NEXT_SNAPSHOT_GATEIN_VERSION</org.exoplatform.portal.version>"                    $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.gatein.version>$RELEASE_GATEIN_VERSION</org.exoplatform.gatein.version>"                    "<org.exoplatform.gatein.version>$NEXT_SNAPSHOT_GATEIN_VERSION</org.exoplatform.gatein.version>"                    $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.xcmis.version>$RELEASE_XCMIS_VERSION</org.xcmis.version>"                                               "<org.xcmis.version>$NEXT_SNAPSHOT_XCMIS_VERSION</org.xcmis.version>"                                               $PRJ_DIR/$1/pom.xml
  replaceInFile "<xcmis.version>$RELEASE_XCMIS_VERSION</xcmis.version>"                                                       "<xcmis.version>$NEXT_SNAPSHOT_XCMIS_VERSION</xcmis.version>"                                                       $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ide.version>$RELEASE_IDE_VERSION</org.exoplatform.ide.version>"                             "<org.exoplatform.ide.version>$NEXT_SNAPSHOT_IDE_VERSION</org.exoplatform.ide.version>"                             $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.gwtframework.version>$RELEASE_GWTFWK_VERSION</org.exoplatform.gwtframework.version>"        "<org.exoplatform.gwtframework.version>$NEXT_SNAPSHOT_GWTFWK_VERSION</org.exoplatform.gwtframework.version>"        $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.commons.version>$RELEASE_COMMONS_VERSION</org.exoplatform.commons.version>"                 "<org.exoplatform.commons.version>$NEXT_SNAPSHOT_COMMONS_VERSION</org.exoplatform.commons.version>"                 $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.cs.version>$RELEASE_CS_VERSION</org.exoplatform.cs.version>"                                "<org.exoplatform.cs.version>$NEXT_SNAPSHOT_CS_VERSION</org.exoplatform.cs.version>"                                $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ks.version>$RELEASE_KS_VERSION</org.exoplatform.ks.version>"                                "<org.exoplatform.ks.version>$NEXT_SNAPSHOT_KS_VERSION</org.exoplatform.ks.version>"                                $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.ecms.version>$RELEASE_ECMS_VERSION</org.exoplatform.ecms.version>"                          "<org.exoplatform.ecms.version>$NEXT_SNAPSHOT_ECMS_VERSION</org.exoplatform.ecms.version>"                          $PRJ_DIR/$1/pom.xml
  replaceInFile "<org.exoplatform.social.version>$RELEASE_SOCIAL_VERSION</org.exoplatform.social.version>"                    "<org.exoplatform.social.version>$NEXT_SNAPSHOT_SOCIAL_VERSION</org.exoplatform.social.version>"                    $PRJ_DIR/$1/pom.xml
}

function commit {
  svnCommand $1 commit -m"[$THIS_RELEASE_JIRA_ID] $2" $THIS_SVN_CREDENTIALS
  return;
}

function status {
  svnCommand $1 status
  return;
}

function diff {
  svnCommand $1 diff
  return;
}

function usage {
 echo "Usage: $0 action project"
 echo "  action  : The action to do"
 echo "    before-release | prepare-release | perform-release | rollback-release | after-release | full-release | commit | status | diff | ckeck-versions | create-release-branch"
 echo "  project : The project where action must be done" 
 echo "    kernel-2.2.x | core-2.3.x | ws-2.1.x | jcr-1.12.x | jcr-services-1.12.x | gatein-3.1.x | xcmis-1.1.x | gwt-fwk-1.0.x | ide-1.0.x | commons-1.0.x | ecms-2.1.x | social-1.1.x | cs-2.1.x | ks-2.1.x | plf-3.0.x"
}

if [ $# -lt 1 ]; then
 echo ">>> Missing arguments"
 usage
 exit;
fi;

case $1 in
  "check-versions")
    checkVersions
    exit;
    ;;
  "before-release")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    beforeRelease "$2"
    exit;
    ;;
  "prepare-release")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    prepareRelease "$2"
    exit;
    ;;
  "perform-release")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    performRelease "$2"
    exit;
    ;;
  "rollback-release")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    rollbackRelease "$2"
    exit;
    ;;
  "after-release")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    afterRelease "$2"
    exit;
    ;;
  "full-release")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    read -p "Press any key to start the release process of $2 ... (CTRL+C to abort)"    
    beforeRelease "$2"
    diff "$2"
    read -p "Press any key to commit changes and continue the release process of $2 ... (CTRL+C to abort)"    
    commit "$2" "Upgrade dependencies to latest releases"
    prepareRelease "$2"
    performRelease "$2"
    afterRelease "$2"
    diff "$2"
    read -p "Press any key to commit changes and continue the release process of $2 ... (CTRL+C to abort)"    
    commit "$2" "Upgrade dependencies to next snapshots"
    echo "!!! DO NOT FORGET TO CLOSE THE STAGING REPOSITORY IN NEXUS !!!"
    exit;
    ;;
  "commit")
    if [ $# -lt 3 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    commit "$2" "$3"
    exit;
    ;;
  "create-release-branch")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    createReleaseBranch "$2"
    exit;
    ;;    
  "status")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    status "$2"
    exit;
    ;;
  "diff")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    diff "$2"
    exit;
    ;;
  *)
    echo ">>> action is invalid"
    usage
    exit;
    ;;
esac
