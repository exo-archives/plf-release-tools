#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh
source ${SCRIPTS_DIR}/plf-release-config.sh

#rm -rf $PRJ_DIR/*

echo "==============================================================================="
echo "Clone from GitHub all platform projects"
echo "==============================================================================="

# Projects list.
# Each element contains project name, corresponding stable branch and release version
projects=(
  'chat-application'         $RELEASE_CHAT_BRANCH              $RELEASE_CHAT_VERSION
  'remote-edit'              $RELEASE_REMOTE_EDIT_BRANCH       $RELEASE_REMOTE_EDIT_VERSION
  'wcm-template-pack'        $RELEASE_SITE_TEMPLATE_BRANCH     $RELEASE_SITE_TEMPLATE_VERSION
  'task'                    $RELEASE_TASKS_BRANCH             $RELEASE_TASKS_VERSION
  'weemo-extension'          $RELEASE_VIDEO_CALL_BRANCH        $RELEASE_VIDEO_CALL_VERSION
  'acme-sample'         $RELEASE_ACME_BRANCH             $RELEASE_ACME_VERSION
  'answers'             $RELEASE_ANSWERS_BRANCH          $RELEASE_ANSWERS_VERSION
  'cas-addon'           $RELEASE_CAS_BRANCH              $RELEASE_CAS_VERSION
  'cmis-addon'          $RELEASE_CMIS_BRANCH             $RELEASE_CMIS_VERSION
  'ide'                 $RELEASE_IDE_BRANCH              $RELEASE_IDE_VERSION
  'josso-addon'         $RELEASE_JOSSO_BRANCH            $RELEASE_JOSSO_VERSION
  'openam-addon'        $RELEASE_OPENAM_BRANCH           $RELEASE_OPENAM_VERSION
  'saml2-addon'         $RELEASE_SAML_BRANCH             $RELEASE_SAML_VERSION
  'spnego-addon'        $RELEASE_SPNEGO_BRANCH           $RELEASE_SPNEGO_VERSION
  'wai-sample'          $RELEASE_WAI_BRANCH              $RELEASE_WAI_VERSION
  'kernel'        $RELEASE_KERNEL_BRANCH       $RELEASE_KERNEL_VERSION
  'core'          $RELEASE_CORE_BRANCH         $RELEASE_CORE_VERSION
  'ws'            $RELEASE_WS_BRANCH           $RELEASE_WS_VERSION
  'docs-style'    $RELEASE_DOCSTYLE_BRANCH     $RELEASE_DOCSTYLE_VERSION
  'gwtframework'  $RELEASE_GWTFRAMEWORK_BRANCH $RELEASE_GWTFRAMEWORK_VERSION
  'jcr'           $RELEASE_JCR_BRANCH          $RELEASE_JCR_VERSION
  'jcr-services'  $RELEASE_JCR_SERVICES_BRANCH $RELEASE_JCR_SERVICES_VERSION
  'gatein-portal' $RELEASE_GATEIN_PLF_BRANCH   $RELEASE_GATEIN_PLF_VERSION
  'platform-ui'   $RELEASE_PLATFORM_UI_BRANCH  $RELEASE_PLATFORM_UI_VERSION
  'commons'       $RELEASE_COMMONS_BRANCH      $RELEASE_COMMONS_VERSION
  'ecms'          $RELEASE_ECMS_BRANCH         $RELEASE_ECMS_VERSION
  'social'        $RELEASE_SOCIAL_BRANCH       $RELEASE_SOCIAL_VERSION
  'calendar'      $RELEASE_CALENDAR_BRANCH     $RELEASE_CALENDAR_VERSION
  'wiki'          $RELEASE_WIKI_BRANCH         $RELEASE_WIKI_VERSION
  'forum'         $RELEASE_FORUM_BRANCH        $RELEASE_FORUM_VERSION
  'integration'   $RELEASE_INTEGRATION_BRANCH  $RELEASE_INTEGRATION_VERSION
  'platform'      $RELEASE_PLATFORM_BRANCH     $RELEASE_PLATFORM_VERSION
  'platform-public-distributions' $RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_BRANCH
                  $RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_VERSION
  'platform-private-distributions' $RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_BRANCH
                  $RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_VERSION
  'platform-private-trial-distributions' $RELEASE_PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_BRANCH
                                  $RELEASE_PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_VERSION
  'maven-depmgt-pom' $RELEASE_MAVEN_DEPMGT_POM_BRANCH
                  $RELEASE_MAVEN_DEPMGT_POM_VERSION
  )

length=${#projects[@]}/3
function clone_all {
  for (( i=0;i<$length;i++)); do
    PROJECT=${projects[${i}*3]}
    BRANCH=${projects[${i}*3+1]}
    VERSION=${projects[${i}*3+2]}
    if [ -e $PRJ_DIR/${PROJECT} ]; then
      rm -rf $PRJ_DIR/${PROJECT}
    fi
    gitCommand ${PROJECT} clone git@github.com:exoplatform/${PROJECT}.git
    gitCommand ${PROJECT} checkout -b ${BRANCH} remotes/origin/${BRANCH}
  done
}

function clone_single {
  for (( i=0;i<$length;i++)); do
    if [ $1 == ${projects[${i}*3]} ]; then
      PROJECT=${projects[${i}*3]}
      BRANCH=${projects[${i}*3+1]}
      VERSION=${projects[${i}*3+2]}
      if [ -e $PRJ_DIR/${PROJECT} ]; then
        rm -rf $PRJ_DIR/${PROJECT}
      fi
      gitCommand ${PROJECT} clone git@github.com:exoplatform/${PROJECT}.git
      gitCommand ${PROJECT} checkout -b ${BRANCH} remotes/origin/${BRANCH}
      break
    fi
  done
}

if [ $# -lt 1 ]; then
 echo ">>> Missing arguments"
 usage
 exit;
fi;

case $1 in
  "-a")
    clone_all
    exit;
    ;;
  *)
   clone_single $1
   exit;
   ;;
esac
