#!/usr/bin/env sh

export JENKINS_HOME=/tmp
export COPY_REFERENCE_FILE_LOG=/tmp/copy_reference_file.log 

echo $JENKINS_HOME
echo $COPY_REFERENCE_FILE_LOG

#/sbin/tini -s -- /usr/local/bin/jenkins.sh >/dev/null 2>&1 &
#sleep 45
jflint -j http://localhost:8080 \
    -u admin \
    -p $(cat $JENKINS_HOME/secrets/initialAdminPassword) \
    Jenkinsfile