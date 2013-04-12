@ECHO OFF

REM (c) Mark Fink, 2008 - 2013
REM This script is released under the MIT License
REM Warranty in any form is excluded

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
mkdir $SCRIPTPATH/tmp


REM #########################
REM ### system packages
REM #########################

echo 'system packages\nyou need to provide superuser rights to install them'
REM update the package list
sudo apt-get -y update
REM packages to compile Node.js
sudo apt-get -y install libssl-dev git-core pkg-config build-essential curl gcc g++ checkinstall
REM most of the matplotlib dependencies should already be satisfied
sudo apt-get build-dep python-matplotlib
REM we need a JRE for Jenkins...
sudo apt-get -y install openjdk-7-jdk ant maven sysstat
REM we need chrome browser for testing alternatively use firefox esr release!
sudo apt-get -y install chromium-browser
echo 'system packages install completed'


REM #########################
REM ### Node.js installation
REM #########################

echo 'download Node.js - v. 0.8.14'
mkdir $SCRIPTPATH/tmp/node-install
cd $SCRIPTPATH/tmp/node-install
wget http://nodejs.org/dist/v0.8.14/node-v0.8.14.tar.gz
tar -zxf node-v0.8.14.tar.gz
echo 'Node.js download & unpack completed'
echo 'installing Node.js will take a while (it requires compiling C++ prgs)'
echo 'installing Node.js'
cd node-v0.8.14
./configure --prefix=$SCRIPTPATH/runtime/node && make && make install
echo 'Node.js install completed'

echo 'installing Karma / Testacular'
cd $SCRIPTPATH
./runtime/node/bin/npm -g install karma
echo 'Karma / Testacular install completed'


REM #########################
REM ### Jenkins installation
REM #########################

echo 'downloading Jenkins'
cd $SCRIPTPATH/jenkins
wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
echo 'Jenkins download completed'


REM #########################
REM ### Python installation
REM #########################

echo 'installing Python'
mkdir $SCRIPTPATH/tmp/pyrun-install
cd $SCRIPTPATH/tmp/pyrun-install
wget http://downloads.egenix.com/python/install-pyrun
chmod u+x install-pyrun
./install-pyrun $SCRIPTPATH/runtime/pyrun
$SCRIPTPATH/runtime/pyrun/bin/pip install nose pylint nosexcover mock
$SCRIPTPATH/runtime/pyrun/bin/pip install paramiko
$SCRIPTPATH/runtime/pyrun/bin/pip install numpy matplotlib pytz
$SCRIPTPATH/runtime/pyrun/bin/pip install xlrd chameleon
echo 'Python install completed'


REM #########################
REM ### JMeter installation
REM #########################

echo 'installing JMeter'
mkdir $SCRIPTPATH/tmp/jmeter
cd $SCRIPTPATH/tmp/jmeter
wget http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-2.9.tgz
tar -zxvf apache-jmeter-2.9.tgz -C $SCRIPTPATH/runtime/
echo 'JMeter install completed'


REM #########################
REM ### cleanup
REM #########################

rm -rf $SCRIPTPATH/tmp/
