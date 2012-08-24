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

Release each platform projects with :

    ~/plf-release-tools/bin/plf-release.sh

Usage guide
-----------

At any moment you can update this set of tools with :

    cd ~/plf-release-tools
    git pull



