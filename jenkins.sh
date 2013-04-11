SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

export JENKINS_HOME=$SCRIPTPATH/jenkins/home
export PATH=$PATH:$SCRIPTPATH/runtime/fitnesse/drivers/

java -jar $SCRIPTPATH/jenkins/jenkins.war

