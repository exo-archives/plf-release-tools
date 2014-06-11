#!/bin/bash -eu
#============================JIRA RELEASE ISSUE==============================#
RELEASE_PLF_JIRA_ID=PLF-5960
#===========================EXO PROJECTS VERSION============================#
EXO_CURRENT_SNAPSHOT_VERSION=4.1.0-SNAPSHOT
EXO_RELEASE_VERSION=4.1-M2
EXO_NEXT_SNAPSHOT_VERSION=4.1.0-SNAPSHOT
RELEASE_DEVELOP_BRANCH=master
#========================================================================#

#=============================ALREADY RELEASE================================#
# ----------------------------KERNEL PROPERTIES-------------------------------
RELEASE_KERNEL_BRANCH=
CURRENT_SNAPSHOT_KERNEL_VERSION=2.4.x-SNAPSHOT
RELEASE_KERNEL_VERSION=2.4.9-GA
NEXT_SNAPSHOT_KERNEL_VERSION=
RELEASE_KERNEL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
KERNEL_PATCHES=
KERNEL_PATCHES_AFTER_RELEASE=
# ----------------------------CORE PROPERTIES----------------------------------
RELEASE_CORE_BRANCH=
CURRENT_SNAPSHOT_CORE_VERSION=2.5.x-SNAPSHOT
RELEASE_CORE_VERSION=2.5.9-GA
NEXT_SNAPSHOT_CORE_VERSION=
RELEASE_CORE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
CORE_PATCHES=
CORE_PATCHES_AFTER_RELEASE=
# ----------------------------WS PROPERTIES------------------------------------
RELEASE_WS_BRANCH=
CURRENT_SNAPSHOT_WS_VERSION=2.3.x-SNAPSHOT
RELEASE_WS_VERSION=2.3.9-GA
NEXT_SNAPSHOT_WS_VERSION=
RELEASE_WS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
WS_PATCHES=
WS_PATCHES_AFTER_RELEASE=
# ----------------------------GWT FRAMEWORK PROPERTIES-------------------------
RELEASE_GWTFRAMEWORK_BRANCH=
CURRENT_SNAPSHOT_GWTFRAMEWORK_VERSION=1.3.x-SNAPSHOT
RELEASE_GWTFRAMEWORK_VERSION=1.3.6
NEXT_SNAPSHOT_GWTFRAMEWORK_VERSION=
RELEASE_GWTFRAMEWORK_JIRA_ID="$RELEASE_PLF_JIRA_ID"
GWTFRAMEWORK_PATCHES=
GWTFRAMEWORK_PATCHES_AFTER_RELEASE=
# ----------------------------JCR PROPERTIES-----------------------------------
RELEASE_JCR_BRANCH=
CURRENT_SNAPSHOT_JCR_VERSION=1.15.x-SNAPSHOT
RELEASE_JCR_VERSION=1.15.9-GA
NEXT_SNAPSHOT_JCR_VERSION=
RELEASE_JCR_JIRA_ID="$RELEASE_PLF_JIRA_ID"
JCR_PATCHES=
JCR_PATCHES_AFTER_RELEASE=
# ----------------------------JCR SERVICES PROPERTIES--------------------------
RELEASE_JCR_SERVICES_BRANCH=
CURRENT_SNAPSHOT_JCR_SERVICES_VERSION=1.15.x-SNAPSHOT
RELEASE_JCR_SERVICES_VERSION=1.15.9-GA
NEXT_SNAPSHOT_JCR_SERVICES_VERSION=
RELEASE_JCR_SERVICES_JIRA_ID="$RELEASE_PLF_JIRA_ID"
JCR_SERVICES_PATCHES=
JCR_SERVICES_PATCHES_AFTER_RELEASE=
# ----------------------------GATEIN PROPERTIES------------------------
RELEASE_GATEIN_BRANCH=
CURRENT_SNAPSHOT_GATEIN_VERSION=3.5.11.Final-SNAPSHOT
RELEASE_GATEIN_VERSION=3.5.10.Final
NEXT_SNAPSHOT_GATEIN_VERSION=
RELEASE_GATEIN_JIRA_ID="$RELEASE_PLF_JIRA_ID"
GATEIN_PATCHES=
JCR_SERVICES_PATCHES_AFTER_RELEASE=
# ----------------------------GATEIN PRODUCT PROPERTIES------------------------
RELEASE_GATEIN_PLF_BRANCH=
CURRENT_SNAPSHOT_GATEIN_PLF_VERSION=3.5.x-PLF-SNAPSHOT
RELEASE_GATEIN_PLF_VERSION=3.5.10-PLF
NEXT_SNAPSHOT_GATEIN_PLF_VERSION=
RELEASE_GATEIN_PLF_JIRA_ID="$RELEASE_PLF_JIRA_ID"
GATEIN_PLF_PATCHES=
GATEIN_PLF_PATCHES_AFTER_RELEASE=
# ----------------------------DEPMGT PROPERTIES-------------------------------
RELEASE_DEPMGT_BRANCH=
CURRENT_SNAPSHOT_DEPMGT_VERSION=9-SNAPSHOT
RELEASE_DEPMGT_VERSION=9-M2
NEXT_SNAPSHOT_DEPMGT_VERSION=
RELEASE_DEPMGT_JIRA_ID=
DEPMGT_PATCHES=
DEPMGT_PATCHES_AFTER_RELEASE=
#==============================================================================#
# ----------------------------IDE PROPERIES------------------------------------
RELEASE_IDE_BRANCH=master
CURRENT_SNAPSHOT_IDE_VERSION=1.4.x-SNAPSHOT
RELEASE_IDE_VERSION=1.4-M2
NEXT_SNAPSHOT_IDE_VERSION=1.4.x-SNAPSHOT
RELEASE_IDE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
IDE_PATCHES=
IDE_PATCHES_AFTER_RELEASE=

# ----------------------------DOC-STYLE PROPERTIES-----------------------------
RELEASE_DOCSTYLE_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_DOCSTYLE_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_DOCSTYLE_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_DOCSTYLE_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_DOCSTYLE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
DOCSTYLE_PATCHES=
DOCSTYLE_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM UI PROPERTIES---------------------------
RELEASE_PLATFORM_UI_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_PLATFORM_UI_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_PLATFORM_UI_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_PLATFORM_UI_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_PLATFORM_UI_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_UI_PATCHES=
PLATFORM_UI_PATCHES_AFTER_RELEASE=
# ----------------------------COMMONS PROPERTIES-------------------------------
RELEASE_COMMONS_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_COMMONS_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_COMMONS_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_COMMONS_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_COMMONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
COMMONS_PATCHES=
COMMONS_PATCHES_AFTER_RELEASE=
# ----------------------------ECMS PROPERTIES----------------------------------
RELEASE_ECMS_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_ECMS_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_ECMS_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_ECMS_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_ECMS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
ECMS_PATCHES=
ECMS_PATCHES_AFTER_RELEASE=
# ----------------------------SOCIAL PROPERTIES--------------------------------
RELEASE_SOCIAL_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_SOCIAL_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_SOCIAL_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_SOCIAL_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_SOCIAL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
SOCIAL_PATCHES=
SOCIAL_PATCHES_AFTER_RELEASE=
# ----------------------------CALENDAR PROPERTIES------------------------------
RELEASE_CALENDAR_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_CALENDAR_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_CALENDAR_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_CALENDAR_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_CALENDAR_JIRA_ID="$RELEASE_PLF_JIRA_ID"
CALENDAR_PATCHES=
CALENDAR_PATCHES_AFTER_RELEASE=
# ----------------------------WIKI PROPERTIES----------------------------------
RELEASE_WIKI_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_WIKI_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_WIKI_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_WIKI_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_WIKI_JIRA_ID="$RELEASE_PLF_JIRA_ID"
WIKI_PATCHES=
WIKI_PATCHES_AFTER_RELEASE=
# ----------------------------FORUM PROPERTIES---------------------------------
RELEASE_FORUM_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_FORUM_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_FORUM_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_FORUM_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_FORUM_JIRA_ID="$RELEASE_PLF_JIRA_ID"
FORUM_PATCHES=
FORUM_PATCHES_AFTER_RELEASE=
# ----------------------------INTEGRATION PROPERTIES---------------------------
RELEASE_INTEGRATION_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_INTEGRATION_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_INTEGRATION_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_INTEGRATION_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_INTEGRATION_JIRA_ID="$RELEASE_PLF_JIRA_ID"
INTEGRATION_PATCHES=
INTEGRATION_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM PROPERTIES------------------------------
RELEASE_PLATFORM_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_PLATFORM_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_PLATFORM_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_PLATFORM_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_PLATFORM_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_PATCHES=
PLATFORM_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM PULBIC DISTRIBUTIONS PROPERTIES---------
RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_PLATFORM_PUBLIC_DISTRIBUTIONS_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_PLATFORM_PUBLIC_DISTRIBUTIONS_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_PUBLIC_DISTRIBUTIONS_PATCHES=
PLATFORM_PUBLIC_DISTRIBUTIONS_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM PRIVATE DISTRIBUTIONS PROPERTIES--------
RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_BRANCH=$RELEASE_DEVELOP_BRANCH
CURRENT_SNAPSHOT_PLATFORM_PRIVATE_DISTRIBUTIONS_VERSION=$EXO_CURRENT_SNAPSHOT_VERSION
RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_VERSION=$EXO_RELEASE_VERSION
NEXT_SNAPSHOT_PLATFORM_PRIVATE_DISTRIBUTIONS_VERSION=$EXO_NEXT_SNAPSHOT_VERSION
RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_PRIVATE_DISTRIBUTIONS_PATCHES=
PLATFORM_PRIVATE_DISTRIBUTIONS_PATCHES__AFTER_RELEASE=
# -----------------------------------------------------------------------------


