#!/bin/bash
# bashrc
#
# This file will be copied to ~/.bashrc by nkosetup.sh.

# Create a folder / file for logging all commands entered in any bash session.
mkdir ~/logs/`date +'%Y/%m/%d'`
script -f ~/logs/`date +'%Y/%m/%d/%H-%M-%S'`-$$.log

