#!/bin/bash -eu

DATE=`date "+%Y-%m-%d--%H-%M-%S"`
SEP="`echo | tr '\n' '\001'`"

# Maven Infos (Used to build/release)
# Maven 2
MAVEN_2_VERSION="2.2.1"
MAVEN_2_ARCHIVE="apache-maven-$MAVEN_2_VERSION-bin.zip"
MAVEN_2_DIRNAME="apache-maven-$MAVEN_2_VERSION"
MAVEN_2_URL="http://intranet.exoplatform.org/rest/jcr/repository/collaboration/Groups/platform/users/Documents/ReferenceBinaries/SWF/ApacheMaven/$MAVEN_2_ARCHIVE"

# Maven 3
MAVEN_3_VERSION="3.0.4"
MAVEN_3_ARCHIVE="apache-maven-$MAVEN_3_VERSION-bin.zip"
MAVEN_3_DIRNAME="apache-maven-$MAVEN_3_VERSION"
MAVEN_3_URL="http://intranet.exoplatform.org/rest/jcr/repository/collaboration/Groups/platform/users/Documents/ReferenceBinaries/SWF/ApacheMaven/$MAVEN_3_ARCHIVE"

# Tomcat Infos (Used to package products)
TOMCAT_VERSION="6.0.32"
TOMCAT_ARCHIVE="apache-tomcat-$TOMCAT_VERSION.zip"
TOMCAT_DIRNAME="apache-tomcat-$TOMCAT_VERSION"
TOMCAT_URL="http://intranet.exoplatform.org/rest/jcr/repository/collaboration/Groups/platform/users/Documents/ReferenceBinaries/GateIn-3.0.x/ApacheTomcat/$TOMCAT_ARCHIVE"

# OpenFire Infos (Used to package products)
OPENFIRE_VERSION="3.6.4"
OPENFIRE_ARCHIVE="openfire-$OPENFIRE_VERSION.zip"
OPENFIRE_DIRNAME="openfire-$OPENFIRE_VERSION"
OPENFIRE_URL="http://intranet.exoplatform.org/rest/jcr/repository/collaboration/Groups/platform/users/Documents/ReferenceBinaries/GateIn-3.0.x/OpenFire/$OPENFIRE_ARCHIVE"

# Jboss Infos (Used to package products)
JBOSS_VERSION="5.1.1"
JBOSS_ARCHIVE="jboss-eap-$JBOSS_VERSION.zip"
JBOSS_DIRNAME="jboss-eap-$JBOSS_VERSION/jboss-as"
JBOSS_URL="http://intranet.exoplatform.org/rest/jcr/repository/collaboration/Groups/platform/users/Documents/ReferenceBinaries/JBoss-EAP/$JBOSS_ARCHIVE"

# Directories
HOME_DIR=`cd $SCRIPTS_DIR/..;pwd;`
CONFIG_DIR="$HOME_DIR/config"
DL_DIR="$HOME_DIR/downloads"
TMP_DIR="$HOME_DIR/tmp"
PRJ_DIR="$HOME_DIR/projects"
TOOLS_DIR="$HOME_DIR/tools"
LOGS_DIR="$HOME_DIR/logs"
BACKUPS_DIR="$HOME_DIR/backups"

# Credentials config
CREDENTIALS_FILE=$HOME/.swf_cred
if [ -e $CREDENTIALS_FILE ]; then
  echo "Loading ... $CREDENTIALS_FILE"
  source $CREDENTIALS_FILE
fi

# Shell Environment
if [ -e $HOME/.bashrc ]; then
  echo "Loading ... $HOME/.bashrc"
  if [ -z $(source $HOME/.bashrc) ]; then
    echo "Error on reloading bashrc"
  fi
fi

# decompress value $1 compressed in base64
function decompress {
  echo "$1" | openssl enc -base64 -d
}

# Check if the GPG key is installed
if [ ! -e $HOME/.gnupg/secring.gpg -o ! -e $HOME/.gnupg/pubring.gpg -o ! -e $HOME/.gnupg/gpg.conf ]; then
  echo "==============================================================================="
  echo "!!! Take care, GPG key isn't setup. It is required to do releases !!!"
  echo "==============================================================================="
fi

# #############
# GIT, SVN Functions
# #############

MVN_EXO_CREDENTIALS="-Dusername="$(decompress "$exo_login")" -Dpassword="$(decompress "$exo_password")
MVN_JBOSS_CREDENTIALS="-Dusername="$(decompress "$jboss_login")" -Dpassword="$(decompress "$jboss_password")
SVN_GOOGLE_CREDENTIALS="--username="$(decompress "$google_login")" --password="$(decompress "$google_password")
MVN_GOOGLE_CREDENTIALS="-Dusername="$(decompress "$google_login")" -Dpassword="$(decompress "$google_password")

# Executes $2 git command with "$@" parameters in $1 project directory
function gitCommand {
  PRJ=$1
  COMMAND=$2
  shift
  shift
  echo "Project $PRJ : git $COMMAND in progress ..."
  if [ "$COMMAND" = "clone" ]; then
    (cd $PRJ_DIR && git $COMMAND "$@")
  else
    (cd $PRJ_DIR/$PRJ && git $COMMAND "$@")
  fi
  if [ "$?" -ne "0" ]; then
    echo "!!! Sorry, git failed in $PRJ_DIR/$PRJ. Process aborted. !!!"
    exit 1
  fi
  echo "Done."
  echo "==============================================================================="  
}

# Executes $2 svn command with "$@" parameters in $1 project directory
function svnCommand {
  PRJ=$1
  COMMAND=$2
  shift
  shift
  echo "Project $PRJ : svn $COMMAND in progress ..."
  svn $COMMAND --non-interactive --trust-server-cert "$@" $PRJ_DIR/$PRJ
  if [ "$?" -ne "0" ]; then
    echo "!!! Sorry, svn failed in $PRJ_DIR/$PRJ. Process aborted. !!!"
  fi
  echo "Done."
  echo "==============================================================================="  
}

# #############
# MVN Functions
# #############

# Call "$@" maven phases/plugins and args in $1 project directory
function mvnCommand {
  PRJ=$1
  shift
  echo "Project $PRJ - mvn in progress ..."
  cd $PRJ_DIR/$PRJ
  mvn -B -e "$@"
  if [ "$?" -ne "0" ]; then
    echo "!!! Sorry, maven failed in $PRJ_DIR/$PRJ. Process aborted. !!!"
    exit 1
  fi
  cd -
  echo "Done."
  echo "==============================================================================="
}
