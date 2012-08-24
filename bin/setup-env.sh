#!/bin/bash -eu

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

echo "==============================================================================="
echo "eXo Platform release environment automated setup"
echo "==============================================================================="

# Copy $1 to $2 after having backed up $2 if it existed
function installFile {
  echo "Setup $2"
  # Backup if exists
  if [ -e $2 ]; then
    mv $2 $2.$DATE
    mv $2.$DATE $BACKUPS_DIR
  fi
  mkdir -p ${2%/*}
  cp $1 $2
  chmod 700 $2 #Some files contain passwords
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

# Replaces all occurences of $2 by $3 in file $1
function replaceInFile {
  sed "s${SEP}$2${SEP}$3${SEP}g" $1 > $1.tmp
  mv $1.tmp $1
}

# Replaces in file $1 all occurences of $2 from a value interactively given by the user
# $3 describes the value to input
function askToUserAndReplaceInFile {
  echo -n "Please enter your $3 : "
  stty -echo
  read VALUE
  stty echo
  echo ""
  replaceInFile $1 $2 $VALUE
}

# Downloads the archive $3 of product labeled $1 version $2 from url $4
function downloadProductArchive {
  echo ""
  echo "==============================================================================="
  echo "Download $1 $2 ..."
  echo "==============================================================================="
  if [ -e $DL_DIR/$3 ]; then
    echo "$1 $2 already downloaded in $DL_DIR"
  else
    wget --user=$(decompress "$exo_login") --password=$(decompress "$exo_password") -nc -nd -P $DL_DIR -r $4
    if [ "$?" -ne "0" ] || [ ! -e $DL_DIR/$3 ]; then
      echo "!!! Sorry, cannot download $1 $2 from $4. Installation aborted. !!!"
      exit 1
    fi
  fi
}

# Extracts the archive $3 of product labeled $1 version $2 into the directory $4
function extractProductArchive {
  echo ""
  echo "==============================================================================="
  echo "= Extract $1 $2 ..."
  echo "==============================================================================="
  if [ -e $TOOLS_DIR/$4 ]; then
    echo "$1 $2 already extracted in $TOOLS_DIR"
  else
    unzip $DL_DIR/$3 -d $TOOLS_DIR
    if [ "$?" -ne "0" ]; then
      echo "!!! Sorry, cannot extract $DL_DIR/$3 in $TOOLS_DIR. Installation aborted. !!!"
      exit 1
    fi  
    # Add exec flag which aren't always set in zip archives
    if [ -e $TOOLS_DIR/$4 ]; then
      chmod 755 $TOOLS_DIR/$4/bin/*.sh
    fi
  fi
}

# Store value $2 with 64b compression under key $1 in $3 file
function storeCompressedValue {
  COMPRESSED_VALUE=`echo -n "$2" | openssl enc -base64`
  echo "$1=$COMPRESSED_VALUE" >> "$3"
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

echo "==============================================================================="
echo "Environment : "
echo "==============================================================================="
echo ">>> Operating System :"
uname -a
echo ">>> Java :"
echo "JAVA_HOME   = $JAVA_HOME"
java -version
echo ">>> Git :"
git --version
echo ">>> Directories :"
echo "HOME_DIR    = $HOME_DIR"
echo "SCRIPTS_DIR = $SCRIPTS_DIR"
echo "CONFIG_DIR  = $CONFIG_DIR"
echo "DL_DIR      = $DL_DIR"
echo "PRJ_DIR     = $PRJ_DIR"
echo "TOOLS_DIR   = $TOOLS_DIR"
echo "LOGS_DIR    = $LOGS_DIR"
echo "BACKUPS_DIR = $BACKUPS_DIR"

echo ""
echo "==============================================================================="
echo "Prepare directories ..."
echo "==============================================================================="
mkdir -p $DL_DIR
mkdir -p $TMP_DIR
mkdir -p $PRJ_DIR
mkdir -p $TOOLS_DIR
mkdir -p $LOGS_DIR
mkdir -p $BACKUPS_DIR

echo ""
echo "==============================================================================="
echo "Ask and save user's credentials ..."
echo "==============================================================================="
initCredFile
storeCredential github_login "GitHub Login"
storeCredential github_password "GitHub Password"
storeCredential github_sshprivatekey "File name contains GitHub SSH Private Key"
storeCredential github_passphrase "GitHub Passphrase"
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

echo ""
echo "==============================================================================="
echo "Prepare configuration files ..."
echo "==============================================================================="
# BASH Config
installFile $CONFIG_DIR/bash/bashrc $HOME/.bashrc
replaceInFile $HOME/.bashrc @@M2_HOME@@ $TOOLS_DIR/$MAVEN_DIRNAME
replaceInFile $HOME/.bashrc @@GITHUB_SSH_PRIVATE_KEY@@ $(decompress $github_sshprivatekey)
source $HOME/.bashrc

# Git Config
installFile $CONFIG_DIR/git/gitconfig $HOME/.gitconfig
replaceInFile $HOME/.gitconfig @@GITHUB_LOGIN@@          $(decompress $github_login)
replaceInFile $HOME/.gitconfig @@GITHUB_FULLNAME@@       $(decompress $github_fullname)
replaceInFile $HOME/.gitconfig @@GITHUB_EMAIL@@          $(decompress $github_email)
installFile $CONFIG_DIR/git/gitignore $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

# MAVEN Config
installFile $CONFIG_DIR/maven/settings.xml $HOME/.m2/settings.xml
replaceInFile $HOME/.m2/settings.xml @@EXO_LOGIN@@          $(decompress $exo_login)
replaceInFile $HOME/.m2/settings.xml @@EXO_PASSWORD@@       $(decompress $exo_password)
replaceInFile $HOME/.m2/settings.xml @@JBOSS_LOGIN@@        $(decompress $jboss_login)
replaceInFile $HOME/.m2/settings.xml @@JBOSS_PASSWORD@@     $(decompress $jboss_password)
replaceInFile $HOME/.m2/settings.xml @@GPG_KEY_PASSPHRASE@@ $(decompress $gpg_passphrase)
replaceInFile $HOME/.m2/settings.xml @@TOOLS_DIR@@          $TOOLS_DIR
replaceInFile $HOME/.m2/settings.xml @@TOMCAT_DIRNAME@@     $TOMCAT_DIRNAME
replaceInFile $HOME/.m2/settings.xml @@JBOSS_DIRNAME@@     $JBOSS_DIRNAME

echo "==============================================================================="
echo "= Installing Apache Maven $MAVEN_VERSION ..."
echo "= MAVEN_HOME : $TOOLS_DIR/$MAVEN_DIRNAME"
echo "==============================================================================="

# Download Maven
downloadProductArchive "Apache Maven" $MAVEN_VERSION $MAVEN_ARCHIVE $MAVEN_URL

# Extract archive
extractProductArchive "Apache Maven" $MAVEN_VERSION $MAVEN_ARCHIVE $MAVEN_DIRNAME

echo "==============================================================================="
echo "= Installing Apache Tomcat $TOMCAT_VERSION ..."
echo "= CATALINA_HOME : $TOOLS_DIR/$TOMCAT_DIRNAME"
echo "==============================================================================="

# Download Tomcat
downloadProductArchive "Apache Tomcat" $TOMCAT_VERSION $TOMCAT_ARCHIVE $TOMCAT_URL

# Extract archive
extractProductArchive "Apache Tomcat" $TOMCAT_VERSION $TOMCAT_ARCHIVE $TOMCAT_DIRNAME

echo "==============================================================================="
echo "= Installing JBOSS $JBOSS_VERSION ..."
echo "= JBOSS_HOME : $TOOLS_DIR/$JBOSS_DIRNAME"
echo "==============================================================================="

# Download Jboss
downloadProductArchive "JBoss" $JBOSS_VERSION $JBOSS_ARCHIVE $JBOSS_URL

# Extract archive
extractProductArchive "JBoss" $JBOSS_VERSION $JBOSS_ARCHIVE $JBOSS_DIRNAME

echo "==============================================================================="
echo "= Installing OpenFire $OPENFIRE_VERSION ..."
echo "= OPENFIRE_HOME : $TOOLS_DIR/$OPENFIRE_DIRNAME"
echo "==============================================================================="

# Download OpenFire
downloadProductArchive "OpenFire" $OPENFIRE_VERSION $OPENFIRE_ARCHIVE $OPENFIRE_URL

# Extract archive
extractProductArchive "OpenFire" $OPENFIRE_VERSION $OPENFIRE_ARCHIVE $OPENFIRE_DIRNAME

echo ""
echo "==============================================================================="
echo "= Apache Maven $MAVEN_VERSION is ready "
echo "==============================================================================="
mvn --version

echo ""
echo "==============================================================================="
echo "= Apache Tomcat $TOMCAT_VERSION is ready "
echo "==============================================================================="
$TOOLS_DIR/$TOMCAT_DIRNAME/bin/version.sh

echo "==============================================================================="
echo "eXo Platform release environment ready !!!"
echo "==============================================================================="
echo "!!! DO NOT FORGET TO SET UP YOUR GITHUB SSH PRIVATE KEY (~/.ssh/$(decompress $github_sshprivatekey)) !!!"

exit 0
