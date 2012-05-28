### #######################
### PLATEFORM RELEASE TOOLS
### #######################

This tools are provided to ease the release of all products involved in platform.

# ############
# PREREQUISITE
# ############
You need to have a dedicated unix account to deploy these tools.

On this host you need the following prerequisites :
* Subversion 
** As root using YUM Package manager : yum install svn
* Java Development Kit 1.6 
** As root using YUM Package manager : yum install java-1.6.0-openjdk-devel
** Set JAVA_HOME in /etc/environment (export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk.x86_64)
* OpenOffice Headless Server 
** As root using YUM Package manager : yum install openoffice.org-headless openoffice.org-brand openoffice.org-writer)

# ##########################
# Initialize the environment
# ##########################

Checkout in the root of your account the content of plf-release-tools from SVN :

  svn co http://svn.exoplatform.org/exo-int/swf/tools/plf-release-tools/ ~

At any moment you can update this set of tools with :

  svn up ~

Setup all softwares required and settings with :
  
  ~/bin/setup-env.sh