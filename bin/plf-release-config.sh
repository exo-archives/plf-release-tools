#!/bin/bash -eu

# -----------------------------------------------------------------------------
RELEASE_PLF_JIRA_ID=PLFENG-835
# -----------------------------------------------------------------------------
RELEASE_KERNEL_BRANCH=stable/2.2.x
# -----------------------------------------------------------------------------
RELEASE_CORE_BRANCH=stable/2.3.x
# -----------------------------------------------------------------------------
RELEASE_WS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_JCR_BRANCH=stable/1.12.x
# -----------------------------------------------------------------------------
RELEASE_JCR_SERVICES_BRANCH=stable/1.12.x
# -----------------------------------------------------------------------------
RELEASE_EXOGTN_BRANCH=stable/3.1.x
# -----------------------------------------------------------------------------
RELEASE_GWTFRAMEWORK_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_IDE_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_COMMONS_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_ECMS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_SOCIAL_BRANCH=stable/1.1.x
# -----------------------------------------------------------------------------
RELEASE_CS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_KS_BRANCH=stable/2.1.x
# -----------------------------------------------------------------------------
RELEASE_PLATFORM_BRANCH=stable/3.0.x
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_KERNEL_VERSION=2.2.13-GA-SNAPSHOT
RELEASE_KERNEL_VERSION=2.2.13-GA
NEXT_SNAPSHOT_KERNEL_VERSION=2.2.14-GA-SNAPSHOT
RELEASE_KERNEL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_CORE_VERSION=2.3.14-GA-SNAPSHOT
RELEASE_CORE_VERSION=2.3.14-GA
NEXT_SNAPSHOT_CORE_VERSION=2.3.15-GA-SNAPSHOT
RELEASE_CORE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_WS_VERSION=2.1.14-GA-SNAPSHOT
RELEASE_WS_VERSION=2.1.14-GA
NEXT_SNAPSHOT_WS_VERSION=2.1.15-GA-SNAPSHOT
RELEASE_WS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_JCR_VERSION=1.12.14-GA-SNAPSHOT
RELEASE_JCR_VERSION=1.12.14-GA
NEXT_SNAPSHOT_JCR_VERSION=1.12.15-GA-SNAPSHOT
RELEASE_JCR_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_JCR_SERVICES_VERSION=1.12.14-GA-SNAPSHOT
RELEASE_JCR_SERVICES_VERSION=1.12.14-GA
NEXT_SNAPSHOT_JCR_SERVICES_VERSION=1.12.15-GA-SNAPSHOT
RELEASE_JCR_SERVICES_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_GATEIN_VERSION=3.1.15-PLF-SNAPSHOT
RELEASE_GATEIN_VERSION=3.1.15-PLF
NEXT_SNAPSHOT_GATEIN_VERSION=3.1.16-PLF-SNAPSHOT
RELEASE_GATEIN_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_XCMIS_VERSION=1.2.2
RELEASE_XCMIS_VERSION=1.2.2
NEXT_SNAPSHOT_XCMIS_VERSION=1.2.2
RELEASE_XCMIS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_GWTFWK_VERSION=1.0.9-SNAPSHOT
RELEASE_GWTFWK_VERSION=1.0.9
NEXT_SNAPSHOT_GWTFWK_VERSION=1.0.10-SNAPSHOT
RELEASE_GWTFWK_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_IDE_VERSION=1.0.10-SNAPSHOT
RELEASE_IDE_VERSION=1.0.10
NEXT_SNAPSHOT_IDE_VERSION=1.0.11-SNAPSHOT
RELEASE_IDE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_COMMONS_VERSION=1.0.11-SNAPSHOT
RELEASE_COMMONS_VERSION=1.0.11
NEXT_SNAPSHOT_COMMONS_VERSION=1.0.12-SNAPSHOT
RELEASE_COMMONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_ECMS_VERSION=2.1.11-SNAPSHOT
RELEASE_ECMS_VERSION=2.1.11
NEXT_SNAPSHOT_ECMS_VERSION=2.1.12-SNAPSHOT
RELEASE_ECMS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_SOCIAL_VERSION=1.1.11-SNAPSHOT
RELEASE_SOCIAL_VERSION=1.1.11
NEXT_SNAPSHOT_SOCIAL_VERSION=1.1.12-SNAPSHOT
RELEASE_SOCIAL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_CS_VERSION=2.1.11-SNAPSHOT
RELEASE_CS_VERSION=2.1.11
NEXT_SNAPSHOT_CS_VERSION=2.1.12-SNAPSHOT
RELEASE_CS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_KS_VERSION=2.1.11-SNAPSHOT
RELEASE_KS_VERSION=2.1.11
NEXT_SNAPSHOT_KS_VERSION=2.1.12-SNAPSHOT
RELEASE_KS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_PLF_VERSION=3.0.11-SNAPSHOT
RELEASE_PLF_VERSION=3.0.11
NEXT_SNAPSHOT_PLF_VERSION=3.0.12-SNAPSHOT
# -----------------------------------------------------------------------------
