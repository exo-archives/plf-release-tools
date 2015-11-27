#!/bin/bash -eu

# -----------------------------------------------------------------------------
RELEASE_PLF_JIRA_ID=PLF-6503
# ----------------------------KERNEL PROPERTIES-------------------------------
RELEASE_KERNEL_BRANCH=master
CURRENT_SNAPSHOT_KERNEL_VERSION=2.5.x-SNAPSHOT
RELEASE_KERNEL_VERSION=2.5.1-GA
NEXT_SNAPSHOT_KERNEL_VERSION=2.5.x-SNAPSHOT
RELEASE_KERNEL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
KERNEL_PATCHES=
KERNEL_PATCHES_AFTER_RELEASE=
# ----------------------------CORE PROPERTIES----------------------------------
RELEASE_CORE_BRANCH=master
CURRENT_SNAPSHOT_CORE_VERSION=2.6.x-SNAPSHOT
RELEASE_CORE_VERSION=2.6.1-GA
NEXT_SNAPSHOT_CORE_VERSION=2.6.x-SNAPSHOT
RELEASE_CORE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
CORE_PATCHES=
CORE_PATCHES_AFTER_RELEASE=
# ----------------------------WS PROPERTIES------------------------------------
RELEASE_WS_BRANCH=master
CURRENT_SNAPSHOT_WS_VERSION=2.4.x-SNAPSHOT
RELEASE_WS_VERSION=2.4.1-GA
NEXT_SNAPSHOT_WS_VERSION=2.4.x-SNAPSHOT
RELEASE_WS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
WS_PATCHES=
WS_PATCHES_AFTER_RELEASE=
# ----------------------------MAVEN-DEPMGT PROPERTIES-----------------------------
RELEASE_MAVEN_DEPMGT_POM_BRANCH=release/11.x
RELEASE_MAVEN_DEPMGT_BRANCH=release/11.x
CURRENT_SNAPSHOT_MAVEN_DEPMGT_POM_VERSION=11-SNAPSHOT
CURRENT_SNAPSHOT_MAVEN_DEPMGT_VERSION=11-SNAPSHOT
RELEASE_MAVEN_DEPMGT_POM_VERSION=11-RC1-1
RELEASE_MAVEN_DEPMGT_VERSION=11-RC1-1
NEXT_SNAPSHOT_MAVEN_DEPMGT_POM_VERSION=11-SNAPSHOT
NEXT_SNAPSHOT_MAVEN_DEPMGT_VERSION=11-SNAPSHOT
RELEASE_MAVEN_DEPMGT_POM_JIRA_ID="$RELEASE_PLF_JIRA_ID"
RELEASE_MAVEN_DEPMGT_JIRA_ID="$RELEASE_PLF_JIRA_ID"
MAVEN_DEPMGT_POM_PATCHES=
MAVEN_DEPMGT_PATCHES=
MAVEN_DEPMGT_POM_PATCHES_AFTER_RELEASE=
MAVEN_DEPMGT_PATCHES_AFTER_RELEASE=
# ----------------------------DOC-STYLE PROPERTIES-----------------------------
RELEASE_DOCSTYLE_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_DOCSTYLE_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_DOCSTYLE_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_DOCSTYLE_VERSION=4.3.x-SNAPSHOT
RELEASE_DOCSTYLE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
DOCSTYLE_PATCHES=
DOCSTYLE_PATCHES_AFTER_RELEASE=
# ----------------------------GWT FRAMEWORK PROPERTIES-------------------------
RELEASE_GWTFRAMEWORK_BRANCH=stable/1.3.x
CURRENT_SNAPSHOT_GWTFRAMEWORK_VERSION=1.3.x-SNAPSHOT
RELEASE_GWTFRAMEWORK_VERSION=1.3.6
NEXT_SNAPSHOT_GWTFRAMEWORK_VERSION=1.3.x-SNAPSHOT
RELEASE_GWTFRAMEWORK_JIRA_ID="$RELEASE_PLF_JIRA_ID"
GWTFRAMEWORK_PATCHES=
GWTFRAMEWORK_PATCHES_AFTER_RELEASE=
# ----------------------------JCR PROPERTIES-----------------------------------
RELEASE_JCR_BRANCH=master
CURRENT_SNAPSHOT_JCR_VERSION=1.16.x-SNAPSHOT
RELEASE_JCR_VERSION=1.16.1-GA
NEXT_SNAPSHOT_JCR_VERSION=1.16.x-SNAPSHOT
RELEASE_JCR_JIRA_ID="$RELEASE_PLF_JIRA_ID"
JCR_PATCHES=
JCR_PATCHES_AFTER_RELEASE=
# ----------------------------JCR SERVICES PROPERTIES--------------------------
RELEASE_JCR_SERVICES_BRANCH=master
CURRENT_SNAPSHOT_JCR_SERVICES_VERSION=1.16.x-SNAPSHOT
RELEASE_JCR_SERVICES_VERSION=1.16.1-GA
NEXT_SNAPSHOT_JCR_SERVICES_VERSION=1.16.x-SNAPSHOT
RELEASE_JCR_SERVICES_JIRA_ID="$RELEASE_PLF_JIRA_ID"
JCR_SERVICES_PATCHES=
JCR_SERVICES_PATCHES_AFTER_RELEASE=
# ----------------------------GATEIN PRODUCT PROPERTIES------------------------
RELEASE_GATEIN_PLF_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_GATEIN_PLF_VERSION=4.3.x-RC-PLF-SNAPSHOT
RELEASE_GATEIN_PLF_VERSION=4.3.0-RC1-1-PLF
NEXT_SNAPSHOT_GATEIN_PLF_VERSION=4.3.x-PLF-SNAPSHOT
RELEASE_GATEIN_PLF_JIRA_ID="$RELEASE_PLF_JIRA_ID"
GATEIN_PLF_PATCHES=
GATEIN_PLF_PATCHES_AFTER_RELEASE=
# ----------------------------JUZU PRODUCT PROPERTIES------------------------
RELEASE_JUZU_BRANCH=master
CURRENT_SNAPSHOT_JUZU_VERSION=1.1.x-SNAPSHOT
RELEASE_JUZU_VERSION=1.1.0
NEXT_SNAPSHOT_JUZU_VERSION=1.2.x-SNAPSHOT
RELEASE_JUZU_JIRA_ID="$RELEASE_PLF_JIRA_ID"
JUZU_PATCHES=
JUZU_PATCHES_AFTER_RELEASE=
# ----------------------------IDE PROPERIES------------------------------------
RELEASE_IDE_BRANCH=stable/1.4.x
CURRENT_SNAPSHOT_IDE_VERSION=1.4.x-SNAPSHOT
RELEASE_IDE_VERSION=1.4.1
NEXT_SNAPSHOT_IDE_VERSION=1.4.x-SNAPSHOT
RELEASE_IDE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
IDE_PATCHES=
IDE_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM UI PROPERTIES---------------------------
RELEASE_PLATFORM_UI_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_PLATFORM_UI_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_PLATFORM_UI_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_PLATFORM_UI_VERSION=4.3.x-SNAPSHOT
RELEASE_PLATFORM_UI_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_UI_PATCHES=
PLATFORM_UI_PATCHES_AFTER_RELEASE=
# ----------------------------COMMONS PROPERTIES-------------------------------
RELEASE_COMMONS_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_COMMONS_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_COMMONS_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_COMMONS_VERSION=4.3.x-SNAPSHOT
RELEASE_COMMONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
COMMONS_PATCHES=
COMMONS_PATCHES_AFTER_RELEASE=
# ----------------------------ECMS PROPERTIES----------------------------------
RELEASE_ECMS_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_ECMS_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_ECMS_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_ECMS_VERSION=4.3.x-SNAPSHOT
RELEASE_ECMS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
ECMS_PATCHES=
ECMS_PATCHES_AFTER_RELEASE=
# ----------------------------SOCIAL PROPERTIES--------------------------------
RELEASE_SOCIAL_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_SOCIAL_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_SOCIAL_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_SOCIAL_VERSION=4.3.x-SNAPSHOT
RELEASE_SOCIAL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
SOCIAL_PATCHES=
SOCIAL_PATCHES_AFTER_RELEASE=
# ----------------------------CALENDAR PROPERTIES------------------------------
RELEASE_CALENDAR_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_CALENDAR_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_CALENDAR_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_CALENDAR_VERSION=4.3.x-SNAPSHOT
RELEASE_CALENDAR_JIRA_ID="$RELEASE_PLF_JIRA_ID"
CALENDAR_PATCHES=
CALENDAR_PATCHES_AFTER_RELEASE=
# ----------------------------WIKI PROPERTIES----------------------------------
RELEASE_WIKI_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_WIKI_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_WIKI_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_WIKI_VERSION=4.3.x-SNAPSHOT
RELEASE_WIKI_JIRA_ID="$RELEASE_PLF_JIRA_ID"
WIKI_PATCHES=
WIKI_PATCHES_AFTER_RELEASE=
# ----------------------------FORUM PROPERTIES---------------------------------
RELEASE_FORUM_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_FORUM_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_FORUM_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_FORUM_VERSION=4.3.x-SNAPSHOT
RELEASE_FORUM_JIRA_ID="$RELEASE_PLF_JIRA_ID"
FORUM_PATCHES=
FORUM_PATCHES_AFTER_RELEASE=
# ----------------------------INTEGRATION PROPERTIES---------------------------
RELEASE_INTEGRATION_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_INTEGRATION_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_INTEGRATION_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_INTEGRATION_VERSION=4.3.x-SNAPSHOT
RELEASE_INTEGRATION_JIRA_ID="$RELEASE_PLF_JIRA_ID"
INTEGRATION_PATCHES=
INTEGRATION_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM PROPERTIES------------------------------
RELEASE_PLATFORM_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_PLATFORM_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_PLATFORM_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_PLATFORM_VERSION=4.3.x-SNAPSHOT
RELEASE_PLATFORM_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_PATCHES=
PLATFORM_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM PULBIC DISTRIBUTIONS PROPERTIES---------
RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_PLATFORM_PUBLIC_DISTRIBUTIONS_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_PLATFORM_PUBLIC_DISTRIBUTIONS_VERSION=4.3.x-SNAPSHOT
RELEASE_PLATFORM_PUBLIC_DISTRIBUTIONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_PUBLIC_DISTRIBUTIONS_PATCHES=
PLATFORM_PUBLIC_DISTRIBUTIONS_PATCHES_AFTER_RELEASE=
# ----------------------------PLATFORM PRIVATE DISTRIBUTIONS PROPERTIES--------
RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_PLATFORM_PRIVATE_DISTRIBUTIONS_VERSION=4.3.x-RC-SNAPSHOT
RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_PLATFORM_PRIVATE_DISTRIBUTIONS_VERSION=4.3.x-SNAPSHOT
RELEASE_PLATFORM_PRIVATE_DISTRIBUTIONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_PRIVATE_DISTRIBUTIONS_PATCHES=
PLATFORM_PRIVATE_DISTRIBUTIONS_PATCHES_AFTER_RELEASE=

# ----------------------------PLATFORM PRIVATE TRIAL DISTRIBUTIONS PROPERTIES--------
RELEASE_PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_BRANCH=release/4.3.x
CURRENT_SNAPSHOT_PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_VERSION=4.3.x-SNAPSHOT
RELEASE_PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_VERSION=4.3.0-RC1-1
NEXT_SNAPSHOT_PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_VERSION=4.3.x-SNAPSHOT
RELEASE_PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_PATCHES=
PLATFORM_PRIVATE_TRIAL_DISTRIBUTIONS_PATCHES_AFTER_RELEASE=

# -----------------------------------ADDONS-------------------------------------
# ----------------------------CHAT PROPERTIES------------------------------
RELEASE_CHAT_BRANCH=release/1.2.x
CURRENT_SNAPSHOT_CHAT_VERSION=1.2.x-SNAPSHOT
RELEASE_CHAT_VERSION=1.2.0-RC1-1
NEXT_SNAPSHOT_CHAT_VERSION=1.2.x-SNAPSHOT
RELEASE_CHAT_JIRA_ID="$RELEASE_PLF_JIRA_ID"
CHAT_PATCHES=
CHAT_PATCHES_AFTER_RELEASE=

# ----------------------------REMOTE_EDIT PROPERTIES------------------------------
RELEASE_REMOTE_EDIT_BRANCH=release/1.1.x
CURRENT_SNAPSHOT_REMOTE_EDIT_VERSION=1.1.x-SNAPSHOT
RELEASE_REMOTE_EDIT_VERSION=1.1.0-RC1-1
NEXT_SNAPSHOT_REMOTE_EDIT_VERSION=1.1.x-SNAPSHOT
RELEASE_REMOTE_EDIT_JIRA_ID="$RELEASE_PLF_JIRA_ID"
REMOTE_EDIT_PATCHES=
REMOTE_EDIT_PATCHES_AFTER_RELEASE=

# ----------------------------SITE_TEMPLATE PROPERTIES------------------------------
RELEASE_SITE_TEMPLATE_BRANCH=release/1.0.x
CURRENT_SNAPSHOT_SITE_TEMPLATE_VERSION=1.0.x-SNAPSHOT
RELEASE_SITE_TEMPLATE_VERSION=1.0.0-RC1-1
NEXT_SNAPSHOT_SITE_TEMPLATE_VERSION=1.0.x-SNAPSHOT
RELEASE_SITE_TEMPLATE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
SITE_TEMPLATE_PATCHES=
SITE_TEMPLATE_PATCHES_AFTER_RELEASE=

# ----------------------------TASKS PROPERTIES------------------------------
RELEASE_TASKS_BRANCH=release/1.0.x
CURRENT_SNAPSHOT_TASKS_VERSION=1.0.x-SNAPSHOT
RELEASE_TASKS_VERSION=1.0.0-RC1-2
NEXT_SNAPSHOT_TASKS_VERSION=1.0.x-SNAPSHOT
RELEASE_TASKS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
TASKS_PATCHES=
TASKS_PATCHES_AFTER_RELEASE=

# ----------------------------VIDEO_CALL PROPERTIES------------------------------
RELEASE_VIDEO_CALL_BRANCH=release/1.3.x
CURRENT_SNAPSHOT_VIDEO_CALL_VERSION=1.3.x-SNAPSHOT
RELEASE_VIDEO_CALL_VERSION=1.3.0-RC1-1
NEXT_SNAPSHOT_VIDEO_CALL_VERSION=1.3.x-SNAPSHOT
RELEASE_VIDEO_CALL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
VIDEO_CALL_PATCHES=
VIDEO_CALL_PATCHES_AFTER_RELEASE=



# -----------------------------------------------------------------------------
