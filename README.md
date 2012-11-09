============================================
Setting up the Continuous Integration Server
============================================

In order to work with "The Hitchhiker's Guide to Test Automation" tutorial you need a Jenkins continuous integration server. You will also need runtime environments for the test suites. This repository provides an installation script and all configuration necessary to setup a working Jenkins installation in this folder. Nevertheless it might be necessary to install some additional system packages to your system so the the Node.js environment can be compiled and installed on your Ubuntu / Debian system.

After installation this folder will contain the following runtimes:

* Jenkins
* Node.js / Testacular
* Python / nosetests
* Fitnesse / Selenium


Folder Structure
================

For the tutorial I assume that you will store the tutorial repositories all at the same place like the following:

/home/<yourname>/devel/

My folder structure looks like so:

* /home/mark/devel/ajaxdemo
* /home/mark/devel/tutorial_ci
* /home/mark/devel/tutorial_jasmine
* /home/mark/devel/fitnesse_jukebox


Non Ubuntu / Debian Systems
===========================

Unfortunately I myself do not possess any other OSs than Ubuntu. So I can not easily provide installation scripts for other systems.

For System V compatible systems like other Linux or Mac porting the install.sh script might not be to difficult. I am afraid that for other systems I might be painful. Anyway in case you successfully ported the installation script to your platform and you like to share with others I will happily add your script to this repository. Just make a pull request or send it via mail.
