@ECHO OFF

REM (c) Mark Fink, 2008 - 2013
REM This script is released under the MIT License
REM Warranty in any form is excluded

set SCRIPTPATH=%~dp0
set PATH=%PATH%;%SCRIPTPATH%
mkdir "%SCRIPTPATH%\tmp"

:python
REM #########################
REM ### Python installation
REM #########################

echo 'installing Python'
mkdir "%SCRIPTPATH%\tmp\python-install
cd "%SCRIPTPATH%\tmp\python-install"
wget http://www.python.org/ftp/python/2.7.4/python-2.7.4.msi
wget http://pypi.python.org/packages/2.7/n/numpy/numpy-1.7.1.win32-py2.7.exe
wget http://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.2.1/matplotlib-1.2.1.win32-py2.7.exe
wget http://www.voidspace.org.uk/downloads/pycrypto26/pycrypto-2.6.win32-py2.7.exe
wget http://python-distribute.org/distribute_setup.py
msiexec /i python-2.7.4.msi TARGETDIR="%SCRIPTPATH%\runtime\python" /qn ALLUSERS=0
numpy-1.7.1.win32-py2.7.exe
matplotlib-1.2.1.win32-py2.7.exe
pycrypto-2.6.win32-py2.7.exe
cd "%SCRIPTPATH%"
.\runtime\python\python tmp\python-install\distribute_setup.py
.\runtime\python\Scripts\easy_install pip
.\runtime\python\Scripts\pip install nose pylint nosexcover mock
.\runtime\python\Scripts\pip install paramiko
.\runtime\python\Scripts\pip install pytz
.\runtime\python\Scripts\pip install xlrd chameleon
echo 'Python install completed'


:jenkins
REM #########################
REM ### Jenkins installation
REM #########################

echo 'downloading Jenkins'
cd "%SCRIPTPATH%\jenkins"
wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
cd "%SCRIPTPATH%"
echo 'Jenkins download completed'


:jmeter
REM #########################
REM ### JMeter installation
REM #########################

echo 'installing JMeter'
mkdir "%SCRIPTPATH%\tmp\jmeter-install"
cd "%SCRIPTPATH%\tmp\jmeter-install"
wget http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-2.9.zip
cd "%SCRIPTPATH%"
.\runtime\python\python unzip.py -z "%SCRIPTPATH%\tmp\jmeter-install\apache-jmeter-2.9.zip" -o ".\runtime" -p 100
cd "%SCRIPTPATH%"
echo 'JMeter install completed'


:maven
REM #########################
REM ### Maven installation
REM #########################

echo 'installing Maven'
mkdir "%SCRIPTPATH%\tmp\maven-install"
cd "%SCRIPTPATH%\tmp\maven-install"
wget http://mirror.serversupportforum.de/apache/maven/maven-2/2.2.1/binaries/apache-maven-2.2.1-bin.zip
cd "%SCRIPTPATH%"
.\runtime\python\python unzip.py -z "%SCRIPTPATH%\tmp\maven-install\apache-maven-2.2.1-bin.zip" -o ".\runtime" -p 100
cd "%SCRIPTPATH%"
echo 'Maven install completed'


:node
REM #########################
REM ### Node.js installation
REM #########################

echo 'download Node.js - v. 0.10.4'
mkdir "%SCRIPTPATH%\runtime\node"
cd "%SCRIPTPATH%\runtime\node"
wget http://nodejs.org/dist/v0.10.4/node.exe
mkdir "%SCRIPTPATH%\tmp\node-install"
cd "%SCRIPTPATH%\tmp\node-install"
wget http://nodejs.org/dist/npm/npm-1.2.9.zip
cd "%SCRIPTPATH%"
.\runtime\python\python unzip.py -z "%SCRIPTPATH%\tmp\node-install\npm-1.2.9.zip" -o ".\runtime\node" -p 100
echo 'Node.js install completed'

echo 'installing Karma'
cd "%SCRIPTPATH%"
.\runtime\node\npm -g install karma
echo 'Karma install completed'


:cleanup
REM #########################
REM ### cleanup
REM #########################

rmdir /s /q "%SCRIPTPATH%\tmp\"

:end