#!/bin/bash

# (c) Mark Fink, 2008 - 2013
# This script is released under the MIT License
# Warranty in any form is excluded

TUTORIAL_FOLDER=$( cd $(dirname $0) ; cd .. ; pwd -P )

#########################
### pull all the demo repositories from github parallel to tutorial_ci
#########################

echo 'pulling demo files'
git clone http://github.com/markfink/supercars \
    $TUTORIAL_FOLDER/supercars
git clone http://github.com/markfink/fitnesse_jukebox \
    $TUTORIAL_FOLDER/fitnesse_jukebox
git clone http://github.com/markfink/SelRunner \
    $TUTORIAL_FOLDER/SelRunner
git clone http://github.com/markfink/tutorial_jasmine \
    $TUTORIAL_FOLDER/tutorial_jasmine
git clone http://github.com/markfink/grandma \
    $TUTORIAL_FOLDER/grandma
echo 'pulling demo files completed'

#########################
### Adjusting paths in Jenkins jobs to local repo locations
#########################

echo 'adjusting Jenkins jobs'
find ./jenkins -name "config.xml" -print | xargs \
    sed -i "s|/home/mark/devel|$TUTORIAL_FOLDER|g"
echo 'adjusting completed'
