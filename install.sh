#!/bin/sh

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
mkdir $SCRIPTPATH/tmp


#########################
### system packages
#########################

echo 'system packages we need superuser rights to install them'
# update the package list
sudo apt-get -y update
# packages to compile Node.js
sudo apt-get -y install libssl-dev git-core pkg-config build-essential curl gcc g++ checkinstall
# we need a JRE for Jenkins...
sudo default-jre 
echo 'system packages install completed'


#########################
### Node.js installation
#########################

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

echo 'installing Testacular'
cd $SCRIPTPATH
./runtime/node/bin/npm -g install testacular@canary
echo 'Testacular install completed'


#########################
### Jenkins installation
#########################

echo 'downloading Jenkins'
cd $SCRIPTPATH/jenkins
wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
echo 'Jenkins download completed'


#########################
### Python installation
#########################

echo 'installing Python'
mkdir $SCRIPTPATH/tmp/pyrun-install
cd $SCRIPTPATH/tmp/pyrun-install
wget http://downloads.egenix.com/python/install-pyrun
chmod u+x install-pyrun
./install-pyrun $SCRIPTPATH/runtime/pyrun
$SCRIPTPATH/runtime/pyrun/bin/pip install nose pylint nosexcover mock
echo 'Python install completed'
