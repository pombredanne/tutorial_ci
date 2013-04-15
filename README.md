============================================
Setting up the Continuous Integration Server
============================================

In order to work with the tutorial in "The Hitchhiker's Guide to Test Automation" book you need a Jenkins continuous integration server. You will also need runtime environments for the test suites. This repository provides an installation script and all configuration necessary to setup a working Jenkins installation in this folder.


Installation
============

You will be asked for the admin password by the installation script so that the script can install the Ubuntu / Debian system packages that are required to compile Node.js. If you are cautious you should check the scripts in advance for that packages that will be installed and any malicious code.

*Location of the tutorial folder*

First you need to define a location where you want to put all the demo files. Lets say you want to put everything in "/home/marvin/tutorial" where "marvin" would be your user name.

Open a console and create the "tutorial" directory:

```bash
mkdir /home/marvin/tutorial
cd /home/marvin/tutorial
```


*Pull the tutorial_ci server*

You are currently in "/home/marvin/tutorial". You use the git client to pull all the necessary installation and configuration files from the tutorial_ci repository at github to your local tutorial folder.

```bash
git clone --depth 1 http://github.com/markfink/tutorial_ci
```

*Installing the open source test automation tools*

This section walks you through the installation of tools required for the book demos. In order to ease the installation procedure, I created a installation script that downloads, installs, and adds the required configuration for each tool to your local tutorial folder. This means you can experiment without messing up your environment. All you need to know is how to run this installation script. Each test-automation tool comes with its own specific installation procedure which is outside of the scope of the book. If you need specific information you should visit the tools project page and read its README and installation manuals.

The installation script downloads, makes and installs the following tools into the tutorial_ci/runtime folder:

* Jenkins
* Node.js / Testacular
* Python / nosetests
* Fitnesse / Selenium
* JMeter

If you are ready, just run the installation script:

```bash
cd tutorial_ci
./install.sh
```


*Pull the demo repositories*

In order to give your continuous integration server something to do you need the demo projects. I provided a script that does all the work (again prerequisite is git).

The pull_demos.sh script gets the following demo projects from github:

* supercars - the Supercar sample application
* fitnesse_jukebox - tutorial on using FitNesse
* SelRunner - using FitNesse for browser automation
* tutorial_jasmine - tutorial on using Jasmine for testing the jukebox sample
* grandma - a combinatorial testing tool and sample tests

When running the script all the demo projects will be stored in your tutorial folder e.g. "/home/marvin/tutorial".

If you are ready, just run the pull_demos script:

```bash
cd tutorial_ci
./pull_demos.sh
```

Non Ubuntu / Debian Systems
===========================

Unfortunately I myself do not possess any other OSs than Ubuntu. So I can not easily provide installation scripts for other systems.

For System V compatible systems like other Linux or Mac porting the install.sh script might not be to difficult. I am afraid that for other systems I might be painful. Anyway in case you successfully ported the installation script to your platform and you like to share with others I will happily add your script to this repository. Just make a pull request or send it via mail.

For Windows (TM) operating systems I made an effort in April to port the scripts. I tested them on Windows XP (TM) and Windows 7 (TM). For the description of the installation process please have a look at README_WIN.md.
