#!/bin/bash

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

export JENKINS_HOME=$SCRIPTPATH/jenkins/home
export FIREFOX_BIN=$SCRIPTPATH/runtime/firefox/firefox
export PATH=$SCRIPTPATH/runtime/firefox/:$SCRIPTPATH/runtime/fitnesse/drivers/:$PATH

java -jar $SCRIPTPATH/jenkins/jenkins.war

