#!/bin/bash -eu

# -----------------------------------------------------------------------------
RELEASE_PLF_JIRA_ID=PLF-3866
# -----------------------------------------------------------------------------
RELEASE_KERNEL_BRANCH=stable/2.3.x
# -----------------------------------------------------------------------------
RELEASE_CORE_BRANCH=stable/2.4.x
# -----------------------------------------------------------------------------
RELEASE_WS_BRANCH=stable/2.2.x
# -----------------------------------------------------------------------------
RELEASE_JCR_BRANCH=stable/1.14.x
# -----------------------------------------------------------------------------
RELEASE_JCR_SERVICES_BRANCH=stable/1.14.x
# -----------------------------------------------------------------------------
RELEASE_EXOGTN_BRANCH=stable/3.2.x
# -----------------------------------------------------------------------------
RELEASE_WEBOS_BRANCH=stable/2.0.x
# -----------------------------------------------------------------------------
RELEASE_GWTFRAMEWORK_BRANCH=stable/1.1.x
# -----------------------------------------------------------------------------
RELEASE_IDE_BRANCH=stable/1.1.x
# -----------------------------------------------------------------------------
RELEASE_COMMONS_BRANCH=stable/1.1.x
# -----------------------------------------------------------------------------
RELEASE_ECMS_BRANCH=stable/2.3.x
# -----------------------------------------------------------------------------
RELEASE_DOCSTYLE_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_SOCIAL_BRANCH=stable/1.2.x
# -----------------------------------------------------------------------------
RELEASE_CS_BRANCH=stable/2.2.x
# -----------------------------------------------------------------------------
RELEASE_KS_BRANCH=stable/2.2.x
# -----------------------------------------------------------------------------
RELEASE_INTEG_BRANCH=stable/1.0.x
# -----------------------------------------------------------------------------
RELEASE_PLATFORM_BRANCH=stable/3.5.x
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_KERNEL_VERSION=2.3.10-GA-SNAPSHOT
RELEASE_KERNEL_VERSION=2.3.10-GA
NEXT_SNAPSHOT_KERNEL_VERSION=2.3.11-GA-SNAPSHOT
RELEASE_KERNEL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_CORE_VERSION=2.4.10-GA-SNAPSHOT
RELEASE_CORE_VERSION=2.4.10-GA
NEXT_SNAPSHOT_CORE_VERSION=2.4.11-GA-SNAPSHOT
RELEASE_CORE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_WS_VERSION=2.2.10-GA-SNAPSHOT
RELEASE_WS_VERSION=2.2.10-GA
NEXT_SNAPSHOT_WS_VERSION=2.2.11-GA-SNAPSHOT
RELEASE_WS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_JCR_VERSION=1.14.10-GA-SNAPSHOT
RELEASE_JCR_VERSION=1.14.10-GA
NEXT_SNAPSHOT_JCR_VERSION=1.14.11-GA-SNAPSHOT
RELEASE_JCR_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_JCR_SERVICES_VERSION=1.14.10-GA-SNAPSHOT
RELEASE_JCR_SERVICES_VERSION=1.14.10-GA
NEXT_SNAPSHOT_JCR_SERVICES_VERSION=1.14.11-GA-SNAPSHOT
RELEASE_JCR_SERVICES_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_GATEIN_VERSION=3.2.7-PLF-SNAPSHOT
RELEASE_GATEIN_VERSION=3.2.7-PLF
NEXT_SNAPSHOT_GATEIN_VERSION=3.2.8-PLF-SNAPSHOT
RELEASE_GATEIN_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_WEBOS_VERSION=2.0.7-SNAPSHOT
RELEASE_WEBOS_VERSION=2.0.7
NEXT_SNAPSHOT_WEBOS_VERSION=2.0.8-SNAPSHOT
RELEASE_WEBOS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_XCMIS_VERSION=1.2.2
RELEASE_XCMIS_VERSION=1.2.2
NEXT_SNAPSHOT_XCMIS_VERSION=1.2.2
RELEASE_XCMIS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_GWTFWK_VERSION=1.1.2
RELEASE_GWTFWK_VERSION=1.1.2
NEXT_SNAPSHOT_GWTFWK_VERSION=1.1.2
RELEASE_GWTFWK_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_IDE_VERSION=1.1.9-SNAPSHOT
RELEASE_IDE_VERSION=1.1.9
NEXT_SNAPSHOT_IDE_VERSION=1.1.10-SNAPSHOT
RELEASE_IDE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_COMMONS_VERSION=1.1.11-SNAPSHOT
RELEASE_COMMONS_VERSION=1.1.11
NEXT_SNAPSHOT_COMMONS_VERSION=1.1.12-SNAPSHOT
RELEASE_COMMONS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_ECMS_VERSION=2.3.10-SNAPSHOT
RELEASE_ECMS_VERSION=2.3.10
NEXT_SNAPSHOT_ECMS_VERSION=2.3.11-SNAPSHOT
RELEASE_ECMS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_DOCSTYLE_VERSION=1.0.9-SNAPSHOT
RELEASE_DOCSTYLE_VERSION=1.0.9
NEXT_SNAPSHOT_DOCSTYLE_VERSION=1.0.11-SNAPSHOT
RELEASE_DOCSTYLE_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_SOCIAL_VERSION=1.2.12-SNAPSHOT
RELEASE_SOCIAL_VERSION=1.2.12
NEXT_SNAPSHOT_SOCIAL_VERSION=1.2.13-SNAPSHOT
RELEASE_SOCIAL_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_CS_VERSION=2.2.12-SNAPSHOT
RELEASE_CS_VERSION=2.2.12
NEXT_SNAPSHOT_CS_VERSION=2.2.13-SNAPSHOT
RELEASE_CS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_KS_VERSION=2.2.12-SNAPSHOT
RELEASE_KS_VERSION=2.2.12
NEXT_SNAPSHOT_KS_VERSION=2.2.13-SNAPSHOT
RELEASE_KS_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_INTEG_VERSION=1.0.10-SNAPSHOT
RELEASE_INTEG_VERSION=1.0.10
NEXT_SNAPSHOT_INTEG_VERSION=1.0.11-SNAPSHOT
RELEASE_INTEG_JIRA_ID="$RELEASE_PLF_JIRA_ID"
# -----------------------------------------------------------------------------
CURRENT_SNAPSHOT_PLF_VERSION=3.5.6-SNAPSHOT
RELEASE_PLF_VERSION=3.5.6
NEXT_SNAPSHOT_PLF_VERSION=3.5.7-SNAPSHOT
# -----------------------------------------------------------------------------
