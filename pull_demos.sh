#!/bin/bash

# (c) Mark Fink, 2008 - 2013
# This script is released under the MIT License
# Warranty in any form is excluded

TUTORIAL_FOLDER=$( cd $(dirname $0/..) ; pwd -P )

# pull all the demo repositories from github parallel to tutorial_ci
git clone http://github.com/markfink/supercars $TUTORIAL_FOLDER
git clone http://github.com/markfink/fitnesse_jukebox $TUTORIAL_FOLDER
git clone http://github.com/markfink/SelRunner $TUTORIAL_FOLDER
git clone http://github.com/markfink/tutorial_jasmine $TUTORIAL_FOLDER
git clone http://github.com/markfink/grandma $TUTORIAL_FOLDER

# adjust the folders in jenkins job to local repo locations
