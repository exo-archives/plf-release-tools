#!/bin/bash -eu

# either 'aio' or 'plf'
if [ -n "$1" ]
then
PRODUCT=$1
else
echo "Usage: source bin/prepare-server.sh aio|plf"
exit 1
fi

if [ $PRODUCT == "aio" ]
then
export JAVA_HOME=/opt/sun-x86-jdk5
export PATH=$JAVA_HOME/bin:$PATH
sed -i -e 's|<!-- RMK_PROFILE -->.*<!-- RMK_PROFILE_END -->|<!-- RMK_PROFILE --><activeProfile>aio-1.6.x</activeProfile><!-- RMK_PROFILE_END -->|g' ~/.m2/settings.xml
fi

if [ $PRODUCT == "plf" ]
then
export JAVA_HOME=/opt/sun-x86-jdk6
export PATH=$JAVA_HOME/bin:$PATH
sed -i -e 's|<!-- RMK_PROFILE -->.*<!-- RMK_PROFILE_END -->|<!-- RMK_PROFILE --><activeProfile>plf-3.0.x</activeProfile><!-- RMK_PROFILE_END -->|g' ~/.m2/settings.xml
fi

echo "New settings:"
echo "- which java: `which java`"
echo "- java:"
java -version
echo "- maven settings:"
cat ~/.m2/settings.xml | grep "RMK_PROFILE"

