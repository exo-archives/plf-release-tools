#!/bin/bash -eu 

SCRIPTS_DIR=${0%/*}
source ${SCRIPTS_DIR}/common.sh

# -----------------------------------------------------------------------------
ECMS_VERSION=2.1.2-CR03
# -----------------------------------------------------------------------------
export EXO_CREDENTIALS=$(decompress "$exo_login"):$(decompress "$exo_password")
export GITHUB_CREDENTIALS=$(decompress "$github_login"):$(decompress "$github_password")

echo $EXO_CREDENTIALS
echo $GITHUB_CREDENTIALS

mkdir -p binaries/WCM/$ECMS_VERSION/

#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms-delivery-wcm-assembly/$ECMS_VERSION/exo-ecms-delivery-wcm-assembly-$ECMS_VERSION-tomcat.zip > binaries/WCM/$ECMS_VERSION/exo-ecms-delivery-wcm-assembly-$ECMS_VERSION-tomcat.zip
#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms-delivery-wcm-jboss-package/$ECMS_VERSION/exo-ecms-delivery-wcm-jboss-package-$ECMS_VERSION-jboss.zip > binaries/WCM/$ECMS_VERSION/exo-ecms-delivery-wcm-jboss-package-$ECMS_VERSION-jboss.zip
#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms-packaging-ecmdemo-ear/$ECMS_VERSION/exo-ecms-packaging-ecmdemo-ear-$ECMS_VERSION.ear > binaries/WCM/$ECMS_VERSION/exo-ecms-packaging-ecmdemo-ear-$ECMS_VERSION.ear
#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms-packaging-wcm-ear/$ECMS_VERSION/exo-ecms-packaging-wcm-ear-$ECMS_VERSION.ear > binaries/WCM/$ECMS_VERSION/exo-ecms-packaging-wcm-ear-$ECMS_VERSION.ear
#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms-packaging-workflow-ear/$ECMS_VERSION/exo-ecms-packaging-workflow-ear-$ECMS_VERSION.ear > binaries/WCM/$ECMS_VERSION/exo-ecms-packaging-workflow-ear-$ECMS_VERSION.ear
#curl --user $GITHUB_CREDENTIALS -L --location-trusted https://raw.github.com/exoplatform/ecms/stable/$ECMS_VERSION/README.txt > binaries/WCM/$ECMS_VERSION/README.txt
#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms-docs-refguide/$ECMS_VERSION/exo-ecms-docs-refguide-$ECMS_VERSION.pdf > binaries/WCM/$ECMS_VERSION/exo-ecms-docs-refguide-$ECMS_VERSION.pdf
#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms-docs-userguide/$ECMS_VERSION/exo-ecms-docs-userguide-$ECMS_VERSION.pdf > binaries/WCM/$ECMS_VERSION/exo-ecms-docs-userguide-$ECMS_VERSION.pdf
#curl --user $EXO_CREDENTIALS -L --location-trusted http://repository.exoplatform.org/content/repositories/$ECMS_NEXUS_REPOSITORY/org/exoplatform/ecms/exo-ecms/$ECMS_VERSION/exo-ecms-$ECMS_VERSION-source-release.zip  > binaries/WCM/$ECMS_VERSION/exo-ecms-$ECMS_VERSION-source-release.zip
#curl --location-trusted https://raw.github.com/exoplatform/ecms/stable/$ECMS_VERSION/README.txt > binaries/WCM/$ECMS_VERSION/README.txt
