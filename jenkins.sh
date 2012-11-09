SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

export JENKINS_HOME=$SCRIPTPATH/jenkins/home

java -jar $SCRIPTPATH/jenkins/jenkins.war

