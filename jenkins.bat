set SCRIPTPATH=%~dp0

set JENKINS_HOME=%SCRIPTPATH%\jenkins\home
set PATH=%PATH%:"%SCRIPTPATH%\runtime\fitnesse\drivers\"

java -jar "%SCRIPTPATH%\jenkins\jenkins.war"
