@ECHO OFF

REM # (c) Mark Fink, 2008 - 2013
REM # This script is released under the MIT License
REM # Warranty in any form is excluded

set SCRIPTPATH=%~dp0
cd ..
set TUTORIAL_FOLDER=%cd%
cd "%SCRIPTPATH%"


:git
REM #########################
REM ## pull all the example repositories from github parallel to tutorial_ci
REM #########################

echo 'pulling example projects'
cd ..
git clone https://github.com/markfink/supercars
git clone https://github.com/markfink/fitnesse_jukebox
git clone https://github.com/markfink/SelRunner
git clone https://github.com/markfink/tutorial_jasmine
git clone http://github.com/markfink/grandma
cd "%SCRIPTPATH%"
echo 'pulling example projects completed'


:replace
REM #########################
REM ### Adjusting Jenkins jobs to Windows (TM) and local repo locations
REM #########################

echo 'adjusting Jenkins jobs'
copy /Y .\jenkins\home\jobs\fitnesse-jukebox\config.win.xml .\jenkins\home\jobs\fitnesse-jukebox\config.xml
copy /Y .\jenkins\home\jobs\fitnesse-selrunner\config.win.xml .\jenkins\home\jobs\fitnesse-selrunner\config.xml
copy /Y .\jenkins\home\jobs\fitnesse-supercars\config.win.xml .\jenkins\home\jobs\fitnesse-supercars\config.xml
copy /Y .\jenkins\home\jobs\jasmine-jukebox\config.win.xml .\jenkins\home\jobs\jasmine-jukebox\config.xml
copy /Y .\jenkins\home\jobs\jasmine-supercars-controllers\config.win.xml .\jenkins\home\jobs\jasmine-supercars-controllers\config.xml
copy /Y .\jenkins\home\jobs\nosetests-supercars-backend\config.win.xml .\jenkins\home\jobs\nosetests-supercars-backend\config.xml

.\runtime\python\python replace.py "/home/mark/devel" "%TUTORIAL_FOLDER%" ".\jenkins\home\jobs\*\config.xml"
echo 'adjusting completed'


:maven
REM #########################
REM ### Compile the JukeBox example
REM #########################

.\runtime\apache-maven-2.2.1\bin\mvn -f "%TUTORIAL_FOLDER%\fitnesse_jukebox/pom.xml" compile

:end