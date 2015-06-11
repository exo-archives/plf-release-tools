PLATFORM RELEASE TOOLS
======================

This tools are provided to ease the release of all products involved in platform.

Prerequisites
-------------

This tooling is targeting Linux platforms.
We consider that you have a dedicated user account for that usage on a computer to deploy these tools.

On this host you need the following prerequisites :

* Subversion command line tool
* Git command line tool
* Java Development Kit 1.6 
* OpenOffice Headless Server (used in documentations conversions)

Initialize the environment
--------------------------

This step has to be done once to prepare your environment.

Checkout in the root of your account the content of plf-release-tools from Git (We use an anonymous ssh access to github to initiate the process) :

    git clone git://github.com/exoplatform/plf-release-tools.git

Setup all softwares required and settings with :
  
    ~/plf-release-tools/bin/setup-env.sh

Clone from GitHub all platform projects with :

    ~/plf-release-tools/bin/plf-git-clone.sh

Configure the release by edit:

    ~/plf-release-tools/bin/plf-release-config.sh

   For each project, edit the following information
     RELEASE_PROJECT_BRANCH: Project branch to release
     CURRENT_SNAPSHOT_PROJECT_VERSION: Current SNAPSHOT version
     RELEASE_PROJECT_VERSION: Version to release
     NEXT_SNAPSHOT_PROJECT_VERSION: Next snapshot version after release
     PROJECT_PATCHES: Patches list to apply during release version. The delimiter is space character

Release each platform projects:
    - Go to bin folder
    cd  ~/plf-release-tools/bin
    - Start release
    plf-release.sh full-release <project_name>

Note: Currently plf-release only works when user in bin folder 

Merge release branch to stable branch then remove release branch
    - Go to bin folder
    cd  ~/plf-release-tools/bin
    - Run
    plf-release.sh after-release <project_name>

Note: Currently plf-release only works when user in bin folder

Usage guide
-----------


At any moment you can update this set of tools with :

    cd ~/plf-release-tools
    git pull

