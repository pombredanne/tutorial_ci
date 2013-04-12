@ECHO OFF

REM # (c) Mark Fink, 2008 - 2013
REM # This script is released under the MIT License
REM # Warranty in any form is excluded

set SCRIPTPATH=%~dp0

REM #########################
REM ## pull all the demo repositories from github parallel to tutorial_ci
REM #########################

echo 'pulling demo files'
cd ..
git clone http://github.com/markfink/supercars
git clone http://github.com/markfink/fitnesse_jukebox
git clone http://github.com/markfink/SelRunner
git clone http://github.com/markfink/tutorial_jasmine
git clone http://github.com/markfink/grandma
cd "%SCRIPTPATH%"
echo 'pulling demo files completed'

REM #########################
REM ### Adjusting paths in Jenkins jobs to local repo locations
REM #########################

echo 'adjusting Jenkins jobs'
.\runtime\python\python replace.py "/home/mark/devel" "%SCRIPTPATH%" ".\jenkins\**\config.xml"
REM find ./jenkins -name "config.xml" -print | xargs \
REM     sed -i "s|/home/mark/devel|$TUTORIAL_FOLDER|g"
echo 'adjusting completed'

REM #########################
REM ### Compile the JukeBox example
REM #########################

.\runtime\apache-maven-2.2.1\bin\mvn -f %SCRIPTPATH%\fitnesse_jukebox/pom.xml compile
