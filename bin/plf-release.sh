#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh
source ${SCRIPTS_DIR}/plf-release-config.sh

projects=(
  'kernel'        "KERNEL"               "org.exoplatform.kernel.version"           
  'core'          "CORE"                 "org.exoplatform.core.version"
  'ws'            "WS"                   "org.exoplatform.ws.version"
  'docs-style'    "DOCSTYLE"             "org.exoplatform.doc.doc-style.version"
  'docs-style'    "DOCSTYLE"             "doc-style.version"
  'gwtframework'  "GWTFRAMEWORK"         "org.exoplatform.gwtframework.version"
  'jcr'           "JCR"                  "org.exoplatform.jcr.version"
  'jcr-services'  "JCR_SERVICES"         "org.exoplatform.jcr-services.version"
  'jcr-services'  "JCR_SERVICES"         "org.exoplatform.jcr.services.version"
  'gatein-portal' "GATEIN_PLF"           "org.gatein.portal.version"
  'gatein-portal' "GATEIN_PLF"           "org.exoplatform.gatein.version"
  'ide'           "IDE"                  "org.exoplatform.ide.version"
  'platform-ui'   "PLATFORM_UI"          "org.exoplatform.platform-ui.version"
  'commons'       "COMMONS"              "org.exoplatform.commons.version"
  'ecms'          "ECMS"                 "org.exoplatform.ecms.version"
  'social'        "SOCIAL"               "org.exoplatform.social.version"
  'calendar'      "CALENDAR"             "org.exoplatform.calendar.version"
  'wiki'          "WIKI"                 "org.exoplatform.wiki.version"
  'forum'         "FORUM"                "org.exoplatform.forum.version"
  'integration'   "INTEGRATION"          "org.exoplatform.integ.version"
  'platform'      "PLATFORM"             "org.exoplatform.platform.version"
  'platform'      "PLATFORM"             "exoplatform.version"
  'platform-public-distributions' "PLATFORM_PUBLIC_DISTRIBUTIONS" "org.exoplatform.platform.distributions.version"
  'platform-private-distributions' "PLATFORM_PRIVATE_DISTRIBUTIONS" "org.exoplatform.platform.private.distributions.version"
  'maven-depmgt-pom' "MAVEN_DEPMGT"  "org.exoplatform.depmgt.version"
  'acme-sample' "ACME_SAMPLE" "acme-sample"
  'wai-sample' "WAI_SAMPLE" "wai-sample"
  'chat-application' "CHAT_APPLICATION" "chat-application"
  'weemo-extension' "WEEMO_EXTENSION" "weemo-extension"
  'answers' "ANSWERS" "answers"
 )

lengthProperties=$((${#projects[@]}/3))

function init {
  for (( i=0;i<$lengthProperties;i++)); do
    if [ $1 = ${projects[${i}*3]} ]; then
      PRJ_NAME=${projects[${i}*3+1]}
      THIS_PROJECT="$1"
      THIS_BRANCH_STRING=RELEASE_${PRJ_NAME}_BRANCH
      THIS_RELEASE_BRANCH_STRING=RELEASE_${PRJ_NAME}_VERSION
      THIS_CURRENT_SNAPSHOT_VERSION_STRING=CURRENT_SNAPSHOT_${PRJ_NAME}_VERSION
      THIS_RELEASE_VERSION_STRING=RELEASE_${PRJ_NAME}_VERSION
      THIS_NEXT_SNAPSHOT_VERSION_STRING=NEXT_SNAPSHOT_${PRJ_NAME}_VERSION
      THIS_RELEASE_JIRA_ID_STRING=RELEASE_${PRJ_NAME}_JIRA_ID
      THIS_PATCHES_STRING=${PRJ_NAME}_PATCHES
      THIS_PATCHES_AFTER_RELEASE_STRING=${PRJ_NAME}_PATCHES_AFTER_RELEASE
      THIS_RELEASE_ADDITIONAL_OPTS_STRING=${PRJ_NAME}_RELEASE_ADDITIONAL_OPTS_STRING
      eval THIS_BRANCH="\$$THIS_BRANCH_STRING"
      eval THIS_RELEASE_BRANCH="release/\$$THIS_RELEASE_BRANCH_STRING"
      eval THIS_CURRENT_SNAPSHOT_VERSION="\$$THIS_CURRENT_SNAPSHOT_VERSION_STRING"
      eval THIS_RELEASE_VERSION="\$$THIS_RELEASE_VERSION_STRING"
      eval THIS_NEXT_SNAPSHOT_VERSION="\$$THIS_NEXT_SNAPSHOT_VERSION_STRING"
      eval THIS_RELEASE_JIRA_ID="\$$THIS_RELEASE_JIRA_ID_STRING"
      eval THIS_PATCHES_VAR="\$$THIS_PATCHES_STRING"
      eval THIS_PATCHES_AFTER_RELEASE_VAR="\$$THIS_PATCHES_AFTER_RELEASE_STRING"
      eval THIS_RELEASE_ADDITIONAL_OPTS="\$$THIS_RELEASE_ADDITIONAL_OPTS_STRING"
      return
    fi
  done
  echo "It is required to specify the project to release";
  exit;

}

function replaceInFile {
  sed -i "s${SEP}$1${SEP}$2${SEP}g" "$3"
}

function checkVersions {
  echo "============ Check eXo Dependencies version for $1 project ================"
  if [ ! -e $PRJ_DIR/$1 ]; then
    echo "ATTENTION: $1 does not exist in $PRJ_DIR. Clone it by plf-git-clone.sh $1"
    exit 1;
  fi

  for (( i=0;i<$lengthProperties;i++)); do
    THIS_VER=$(${SCRIPTS_DIR}/find-in-poms.sh "<${projects[${i}*3+2]}"        $PRJ_DIR/$1)
    if [ ! -z "${THIS_VER}" ]; then
      echo "${projects[${i}*3]} version:  " ${THIS_VER}
    fi
  done
}

function beforeRelease {
  rm -rf $M2_REPO
  for (( i=0;i<$lengthProperties;i++)); do
    PRJ_NAME=${projects[${i}*3+1]}
    PRJ_TAG=${projects[${i}*3+2]}
    snapshotVariable=CURRENT_SNAPSHOT_${PRJ_NAME}_VERSION
    releaseVariable=RELEASE_${PRJ_NAME}_VERSION
    eval snapshotValue=\$$snapshotVariable
    eval releaseValue=\$$releaseVariable
    replaceInFile "<${PRJ_TAG}>$snapshotValue</${PRJ_TAG}>" "<${PRJ_TAG}>$releaseValue</${PRJ_TAG}>" $PRJ_DIR/$1/pom.xml
  done
  # Apply patches
  if [[ ! -z "$THIS_PATCHES_VAR" ]]; then
    for PATCH in $THIS_PATCHES_VAR; do
      gitCommand $1 am $PATCHES_DIR/$PATCH
   done
  fi 
}

function prepareRelease {
  echo "prepareRelease: $1"
  if [ ! $1 = "gatein-portal" ] && [ ! $1 = "kernel" ] && [ ! $1 = "ws" ] && [ ! $1 = "core" ] && [ ! $1 = "jcr" ] && [ ! $1 = "jcr-services" ] ; then
  mvnCommand $1 release:prepare -Dtag=$THIS_RELEASE_VERSION -DreleaseVersion=$THIS_RELEASE_VERSION -DdevelopmentVersion=$THIS_NEXT_SNAPSHOT_VERSION -DscmCommentPrefix="[maven-release-plugin] [$THIS_RELEASE_JIRA_ID]" $THIS_RELEASE_ADDITIONAL_OPTS
  else
  mvnCommand $1 release:prepare -Dtag=$THIS_RELEASE_VERSION -DreleaseVersion=$THIS_RELEASE_VERSION -DdevelopmentVersion=$THIS_NEXT_SNAPSHOT_VERSION -DscmCommentPrefix="[maven-release-plugin] [$THIS_RELEASE_JIRA_ID]" $THIS_RELEASE_ADDITIONAL_OPTS -Darguments="-Prelease -DskipTests"
  fi
}

function rollbackRelease_old {
  mvnCommand $1 release:rollback -DscmCommentPrefix="[maven-release-plugin] [$THIS_RELEASE_JIRA_ID]" $THIS_RELEASE_ADDITIONAL_OPTS
  gitCommand $1 tag -d $THIS_RELEASE_VERSION
  gitCommand $1 push origin :refs/tags/$THIS_RELEASE_VERSION
}

function rollbackRelease {
#  mvnCommand $1 release:rollback -DscmCommentPrefix="[maven-release-plugin] [$THIS_RELEASE_JIRA_ID]" $THIS_RELEASE_ADDITIONAL_OPTS
  gitCommand $1 tag -d $THIS_RELEASE_VERSION
  gitCommand $1 push origin :refs/tags/$THIS_RELEASE_VERSION
}

function performRelease {
  if [ ! $1 = "gatein-portal" ] && [ ! $1 = "kernel" ] && [ ! $1 = "ws" ] && [ ! $1 = "core" ] && [ ! $1 = "jcr" ] && [ ! $1 = "jcr-services" ] ; then
  mvnCommand $1 release:perform
  else
  mvnCommand $1 release:perform -Darguments="-Prelease -DskipTests"
  fi
}

function createReleaseBranch {
  mvnCommand $1 release:branch -DbranchName=${THIS_RELEASE_BRANCH} $THIS_RELEASE_ADDITIONAL_OPTS
}

function pushGateinTagAndBranch {
  gitCommand $1 push origin $RELEASE_GATEIN_VERSION
  gitCommand $1 push origin release/$RELEASE_GATEIN_VERSION
}
function afterRelease {
  gitCommand $1 fetch origin
  for (( i=0;i<$lengthProperties;i++)); do
    PRJ=${projects[${i}*3]}
    PRJ_NAME=${projects[${i}*3+1]}
    PRJ_TAG=${projects[${i}*3+2]}
    releaseVariable=RELEASE_${PRJ_NAME}_VERSION
    eval releaseValue=\$$releaseVariable
    nextSnapshotVariable=NEXT_SNAPSHOT_${PRJ_NAME}_VERSION
    eval nextSnapshotValue=\$$nextSnapshotVariable
    replaceInFile "<${PRJ_TAG}>$releaseValue</${PRJ_TAG}>" "<${PRJ_TAG}>$nextSnapshotValue</${PRJ_TAG}>" $PRJ_DIR/$1/pom.xml
  
  done
  diff $1
  gitCommand $1 add .
  gitCommand $1 commit -m "[$THIS_RELEASE_JIRA_ID] $2"
}

function commit {
  gitCommand $1 add .
  gitCommand $1 commit -m "[$THIS_RELEASE_JIRA_ID] $2"
  gitCommand $1 push origin $THIS_RELEASE_BRANCH
  return;
}

function commitRelease {
  gitCommand $1 push origin $THIS_RELEASE_BRANCH:$THIS_BRANCH
  gitCommand $1 push origin :$THIS_RELEASE_BRANCH
  return;
}

function status {
  gitCommand $1 status
  return;
}

function diff {
  gitCommand $1 diff
  return;
}

function usage {
 echo "Usage: $0 action project"
 echo "  action  : The action to do"
 echo "    before-release | prepare-release | perform-release | rollback-release | after-release | full-release | commit | status | diff | check-versions | create-release-branch"
 echo "  project : The project where action must be done" 
 echo "   kernel | core | ws | jcr | jcr-services | gatein-portal | gwtframework | ide | commons | ecms | docs-style | social | wiki | calendar | forum | integration | platform | platform-public-distributions | platform-private-distributions"
}

if [ $# -lt 1 ]; then
 echo ">>> Missing arguments"
 usage
 exit;
fi;
#If releasing platform-private-distribution or gatein-portal, use gatein-portal PRD
if [ $2 = "platform-private-distributions" ] || [ $2 = "gatein-portal" ]; then
  RELEASE_GATEIN_BRANCH="$RELEASE_GATEIN_PLF_BRANCH"
  CURRENT_SNAPSHOT_GATEIN_VERSION="$CURRENT_SNAPSHOT_GATEIN_PLF_VERSION"
  RELEASE_GATEIN_VERSION="$RELEASE_GATEIN_PLF_VERSION"
  NEXT_SNAPSHOT_GATEIN_VERSION="$NEXT_SNAPSHOT_GATEIN_PLF_VERSION"
fi

case $1 in
  "check-versions")
    checkVersions $2
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
    ./plf-git-clone.sh "$2"
    gitCommand $2 rebase origin/$THIS_RELEASE_BRANCH
    if [ ! $2 = "kernel" ] && [ ! $2 = "docs-style" ] && [ ! $2 = "gwtframework" ] && [ ! $2 = "maven-depmgt-pom" ] && [ ! $2 = "weemo-extension" ]; then
      afterRelease "$2" "Upgrade dependencies to next snapshots"
    fi
    # Apply patches
    if [[ ! -z "$THIS_PATCHES_AFTER_RELEASE_VAR" ]]; then
      for PATCH in $THIS_PATCHES_AFTER_RELEASE_VAR; do
        gitCommand $2 am $PATCHES_DIR/$PATCH
      done
    fi
    commitRelease "$2"
    exit;
    ;;
  "full-release")
    if [ $# -lt 2 ]; then
     echo ">>> Missing arguments"
     usage
     exit;
    fi;
    init "$2"
    ./plf-git-clone.sh "$2"
    # Kernel project is not neccessary to update dependencies
    if [ ! $2 = "kernel" ] && [ ! $2 = "docs-style" ] && [ ! $2 = "gwtframework" ] && [ ! $2 = "maven-depmgt-pom" ] && [ ! $2 = "weemo-extension" ]; then 
      echo "before release $2"
      beforeRelease "$2"
      echo "########################################"
      echo "Start Update dependencies for $2"
      echo "########################################"
      diff "$2"   
      commit "$2" "Upgrade dependencies to latest releases"
    fi
    echo "prepare to release $2"
    prepareRelease "$2"
    if [ $2 = "gatein-portal" ]; then
      pushGateinTagAndBranch "$2"
    fi
    echo "perform to release $2"
    performRelease "$2"
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
