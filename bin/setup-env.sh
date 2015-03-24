#!/bin/bash -e

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
    echo "Old $2 is backup at $BACKUPS_DIR"
  fi
  mkdir -p ${2%/*}
  cp $1 $2
  chmod 700 $2 #Some files contain passwords
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
  elif [[ $3 == *.zip ]]; then
    unzip $DL_DIR/$3 -d $TOOLS_DIR
    if [ "$?" -ne "0" ]; then
      echo "!!! Sorry, cannot extract $DL_DIR/$3 in $TOOLS_DIR. Installation aborted. !!!"
      exit 1
    fi  
    # Add exec flag which aren't always set in zip archives
    if [ -e $TOOLS_DIR/$4 ]; then
      if [[ -s $TOOLS_DIR/$4/bin/*.sh ]]; then
        chmod 755 $TOOLS_DIR/$4/bin/*.sh
      fi
    fi
  elif [[ $3 == *.bin ]]; then
    cp $DL_DIR/$3 $TOOLS_DIR/$3
    chmod 755 $TOOLS_DIR/$3
    cd $TOOLS_DIR
    sh $TOOLS_DIR/$3
    rm $TOOLS_DIR/$3
  elif [[ $3 == *.tar.gz ]]; then
    tar zxf $DL_DIR/$3 -C $TOOLS_DIR
    if [ "$?" -ne "0" ]; then
      echo "!!! Sorry, cannot extract $DL_DIR/$3 in $TOOLS_DIR. Installation aborted. !!!"
      exit 1
    fi
  else
    echo "None to extract"
  fi
}


printHeader "System Information"
echo ">>> Operating System :"
uname -a
# Download java
downloadProductArchive "JAVA 6" $JAVA6_VERSION $JAVA6_ARCHIVE $JAVA6_URL
downloadProductArchive "JAVA 7" $JAVA7_VERSION $JAVA7_ARCHIVE $JAVA7_URL
#Extract java  
extractProductArchive "JAVA 6" $JAVA6_VERSION $JAVA6_ARCHIVE $JAVA6_DIRNAME
extractProductArchive "JAVA 7" $JAVA7_VERSION $JAVA7_ARCHIVE $JAVA7_DIRNAME
printFooter "System Information"

printHeader "Download maven $MAVEN_30_VERSION"
# Download Maven
downloadProductArchive "Apache Maven" $MAVEN_30_VERSION $MAVEN_30_ARCHIVE $MAVEN_30_URL

# Extract archive
extractProductArchive "Apache Maven" $MAVEN_30_VERSION $MAVEN_30_ARCHIVE $MAVEN_30_DIRNAME
printFooter "Download maven $MAVEN_30_VERSION"

printHeader "Download maven $MAVEN_32_VERSION"
# Download Maven
downloadProductArchive "Apache Maven" $MAVEN_32_VERSION $MAVEN_32_ARCHIVE $MAVEN_32_URL

# Extract archive
extractProductArchive "Apache Maven" $MAVEN_32_VERSION $MAVEN_32_ARCHIVE $MAVEN_32_DIRNAME
printFooter "Download maven $MAVEN_32_VERSION"

printHeader "Configuration file preparation"
# BASH Config
installFile $CONFIG_DIR/bash/bashrc $HOME/.bashrc
chmod u+x $HOME/.bashrc
replaceInFile $HOME/.bashrc @@M32_HOME@@ $TOOLS_DIR/$MAVEN_32_DIRNAME
replaceInFile $HOME/.bashrc @@M30_HOME@@ $TOOLS_DIR/$MAVEN_30_DIRNAME
replaceInFile $HOME/.bashrc @@JAVA7_HOME@@ $TOOLS_DIR/$JAVA7_DIRNAME
replaceInFile $HOME/.bashrc @@JAVA6_HOME@@ $TOOLS_DIR/$JAVA6_DIRNAME
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
replaceInFile $HOME/.m2/settings.xml @@SERVER_DIR@@   $LOCAL_REPOSITORY_DIR
printFooter "Configuration file preparation"

printHeader "Check software for release"
echo "Java version >>> "
java -version
echo "JAVA_HOME = $JAVA_HOME"
echo "Git version >>>"
git --version
printFooter "Check software for release"

echo "eXo Platform release environment ready !!!"
echo "Type 'source $HOME/.bashrc' to reload session environment"
echo "!!! DO NOT FORGET TO SET UP YOUR GITHUB SSH PRIVATE KEY !!!"

exit 0
