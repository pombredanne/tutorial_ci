===============================================================
Installation of the book software on a Windows (TM) environment
===============================================================

If you want to start out fresh please use a Debian or Ubuntu Linux distribution. This will give you a much more pleasant experience. Details about the installation you will find in the README.md or chapter 11 in the book. 

The Windows (TM) installation should be used only in case there is absolutely no other way. I did my very best to make the book software and tools to install on a Windows (TM) environment. However I am not a regular Windows user so if you find a problem on your particular Windows (TM) flavor I want to encourage you to fix it and to contribute it back so other Windows /TM) users can benefit from it. 

Another thing is if you find out how to improve the installation on a Windows (TM) environm,ent please contribute that as well.


You need a Java JDK environment as well
=======================================

Some of the test automation tools like Selenium 2 need Java. If you have already installed the JDK you can skip this step. Otherwise visit the following link and install the JDK suitable for your platform:
http://www.oracle.com/technetwork/java/javase/downloads/index.html

Do not forget to set the JAVA_HOME folder!

For Ant installation please visit here:
https://ant.apache.org/bindownload.cgi

The installation bin folder must be added to the path veriable. Do not forget to set the ANT_HOME folder!


You need Chrome browser installed
=================================

The default configuration for the Supercar browser tests uses the Google Chrome browser. 

Install Google Chrome:
www.google.com/chrome

Please set the CHROME_BIN environment variable to the locaton of chrome browser executable!
On my test environment this is set to C:\Programme\Google\Chrome\Application\chrome.exe.


You need Firefox browser (ESR) installed
========================================

Start here:
http://www.mozilla.org/en-US/firefox/organizations/all.html

Please set the FIREFOX_BIN environment variable to the locaton of firefox browser executable!
On my test environment this is set to C:\Programme\Mozilla Firefox\firefox.exe.


First you need git
==================

The docu I used:
http://git-scm.com/book/en/Getting-Started-Installing-Git

I just clicked on the most recent installer for git for Windows (TM) here:
https://code.google.com/p/msysgit/downloads/list?q=full+installer+official+git

A installation wizzard opened and I used the proposed defaults. In the "Git Setup" seciton I selected "Run Git from the Windows Command Prompt" because that is what I am going to do.

Please set the GIT_HOME environment variable to the locaton of git.exe!
On my test environment this is set to C:\Programme\Git.

Note: In Jenkins you need to set the git installation folder as well: C:\Programme\Git\bin\git.exe


Installation
============

I created a tutorial folder like the following for the installation of the tutorial related tools and scripts:
C:\tutorial

Note: I really tried to make it work with directories that have spaces in it but I only got a lot of grey hair from it. Eventually I had to gave up on this idea.

Open a cmd console and change into the new folder:
>cd tutorial

*Pull the tutorial_ci server*

You use the newly installed git client to pull all the necessary installation and configuration files from the tutorial_ci repository at github to your local tutorial folder:
>git clone --depth 1 http://github.com/markfink/tutorial_ci

*Installing the open source test automation tools*

This section walks you through the installation of tools required for the book demos. In order to ease the installation procedure, I created a installation script that downloads, installs, and adds the required configuration for each tool to your local tutorial folder. This means you can experiment without messing up your environment. All you need to know is how to run this installation script. Each test-automation tool comes with its own specific installation procedure which is outside of the scope of the book. If you need specific information you should visit the tools project page and read its README and installation manuals.

The installation script downloads, makes and installs the following tools into the tutorial_ci/runtime folder:

* Jenkins
* Node.js / Testacular
* Python / nosetests
* Fitnesse / Selenium
* JMeter

I tried to automate the installation process but unfortunately this is currently not entierly possible. Some of the installers will pop up and you have to move them forward.

If you are ready, just run the installation script:
>cd tutorial_ci
>install.bat


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




