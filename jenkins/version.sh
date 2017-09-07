# docker run --rm jenkins-maven:alpine bash -c "`cat version.sh`"

JAVA_VERSION=`java -version 2>&1 | head -1 | awk -F'"' '{print $2}'`
GIT_VERSION=`git --version | awk '{print $3}'`
MAVEN_VERSION=`mvn -v | head -1 | awk '{print $3}'`

echo JAVA: $JAVA_VERSION
echo GIT: $GIT_VERSION
echo MAVEN: $MAVEN_VERSION
