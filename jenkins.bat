set SCRIPTPATH=%~dp0

set JENKINS_HOME=%SCRIPTPATH%\jenkins\home
set PYTHON_HOME=%SCRIPTPATH%\runtime\python
set PATH=%PATH%;%SCRIPTPATH%\runtime\fitnesse\drivers\;%SCRIPTPATH%\runtime\apache-maven-2.2.1\bin\

java -jar "%SCRIPTPATH%\jenkins\jenkins.war"
