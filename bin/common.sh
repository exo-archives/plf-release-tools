#!/bin/bash -eu

DATE=`date "+%Y-%m-%d--%H-%M-%S"`
SEP="`echo | tr '\n' '\001'`"

# Maven Infos (Used to build/release)
# Maven 30
MAVEN_30_VERSION="3.0.5"
MAVEN_30_ARCHIVE="apache-maven-$MAVEN_30_VERSION-bin.zip"
MAVEN_30_DIRNAME="apache-maven-$MAVEN_30_VERSION"
MAVEN_30_URL="http://storage.exoplatform.org/public/apache-maven/$MAVEN_30_ARCHIVE"

# Maven 32
MAVEN_32_VERSION="3.2.5"
MAVEN_32_ARCHIVE="apache-maven-$MAVEN_32_VERSION-bin.zip"
MAVEN_32_DIRNAME="apache-maven-$MAVEN_32_VERSION"
MAVEN_32_URL="http://storage.exoplatform.org/public/apache-maven/$MAVEN_32_ARCHIVE"


# Java version
JAVA7_VERSION="jdk1.7.0_79"
JAVA7_ARCHIVE="jdk-7u79-linux-x64.tar.gz"
JAVA7_DIRNAME="jdk1.7.0_79"
JAVA7_URL="http://storage.exoplatform.org/public/java/jdk/oracle/7u79/jdk-7u79-linux-x64.tar.gz"

JAVA6_VERSION="jdk1.6.0_45"
JAVA6_ARCHIVE="jdk-6u45-linux-x64.bin"
JAVA6_DIRNAME="jdk1.6.0_45"
JAVA6_URL="http://storage.exoplatform.org/public/java/jdk/sun/6u45-b06/jdk-6u45-linux-x64.bin"
# end Java version


#  ============= BEGIN: essential variables ============================================

# Directories
HOME_DIR=`cd $SCRIPTS_DIR/..;pwd;`
CONFIG_DIR="$HOME_DIR/config"
DL_DIR="$HOME_DIR/downloads"
TMP_DIR="$HOME_DIR/tmp"
PRJ_DIR="$HOME_DIR/projects"
TOOLS_DIR="$HOME_DIR/tools"
LOGS_DIR="$HOME_DIR/logs"
BACKUPS_DIR="$HOME_DIR/backups"
PATCHES_DIR="$HOME_DIR/patches"
LOCAL_REPOSITORY_DIR="$HOME_DIR/exo-dependencies"
# Files
CREDENTIALS_FILE=$HOME/.swf_cred
#  ============= END: essential variables =============================================


#  ============= BEGIN: essential functions ===========================================
# Print header for log
function printHeader {
  echo ""
  echo "==============================================================================="
  echo " Begin $1..."
  echo "==============================================================================="
  echo ""
}

# Print Footer for log
function printFooter {
  echo ""
  echo "==============================================================================="
  echo " End $1..."
  echo "==============================================================================="
  echo ""
}

# Create dir if it does not exist
function createDirectoryIfNotExist {
  if [ ! -d "$1" ]; then
    mkdir -p $1
  fi
}

function initCredFile {
  echo "Initialize $CREDENTIALS_FILE"
  # Backup if exists
  if [ -e $CREDENTIALS_FILE ]; then
    mv $CREDENTIALS_FILE $CREDENTIALS_FILE.$DATE
    mv $CREDENTIALS_FILE.$DATE $BACKUPS_DIR
  fi
  mkdir -p ${CREDENTIALS_FILE%/*}
  touch $CREDENTIALS_FILE
  chmod 700 $CREDENTIALS_FILE
}

# Ask to the user a value named $2 and store it compressed in 64b under key $1 in $CREDENTIALS_FILE
function storeCredential {
  echo -n "Please enter your $2 : "
  stty -echo
  read VALUE
  stty echo
  echo ""
  storeCompressedValue "$1" "$VALUE" "$CREDENTIALS_FILE"
}

# Store value $2 with 64b compression under key $1 in $3 file
function storeCompressedValue {
  COMPRESSED_VALUE=`echo -n "$2" | openssl enc -base64`
  echo "$1=$COMPRESSED_VALUE" >> "$3"
}

#  ============= END: essential functions ===========================================


#  ============= BEGIN: Directory Preparation =======================================
printHeader "Directory Preparation"
echo "HOME_DIR    = $HOME_DIR"
echo "SCRIPTS_DIR = $SCRIPTS_DIR"
echo "CONFIG_DIR  = $CONFIG_DIR"
createDirectoryIfNotExist $DL_DIR
echo "DL_DIR      = $DL_DIR"
createDirectoryIfNotExist $TMP_DIR
echo "TMP_DIR     = $TMP_DIR"
createDirectoryIfNotExist $PRJ_DIR
echo "PRJ_DIR     = $PRJ_DIR"
createDirectoryIfNotExist $TOOLS_DIR
echo "TOOLS_DIR   = $TOOLS_DIR"
createDirectoryIfNotExist $LOGS_DIR
echo "LOGS_DIR    = $LOGS_DIR"
createDirectoryIfNotExist $BACKUPS_DIR
echo "BACKUPS_DIR = $BACKUPS_DIR"
createDirectoryIfNotExist $LOCAL_REPOSITORY_DIR
echo "LOCAL_REPOSITORY_DIR = $LOCAL_REPOSITORY_DIR"
printFooter "Directory Preparation"
#  ============= END: Directory Preparation =======================================

#  ============= BEGIN: Credential initiation =====================================
if [ -e $CREDENTIALS_FILE ]; then
  read -p "Credential file exists. Do you want to use it? Y/y to use it " -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    # Backup
    echo "Backup existing cred"
    mv $CREDENTIALS_FILE $CREDENTIALS_FILE.$DATE
    mv $CREDENTIALS_FILE.$DATE $BACKUPS_DIR
  else
    source $CREDENTIALS_FILE
  fi
fi

if [ ! -e $CREDENTIALS_FILE ]; then
  printHeader "User Credential"
  initCredFile
  storeCredential github_login "GitHub Login"
  storeCredential github_fullname "GitHub Full Name"
  storeCredential github_email "GitHub Email"
  storeCredential exo_login "eXo Login"
  storeCredential exo_password "eXo Password"
  storeCredential jboss_login "JBoss Login"
  storeCredential jboss_password "JBoss Password"
  storeCredential google_login "Google Login"
  storeCredential google_password "Google Password"
  storeCredential gpg_passphrase "GPG Passphrase"
  source $CREDENTIALS_FILE
  printFooter "User Credential"
fi

#  ============= END: Credential initiation =====================================


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
