#!/bin/bash
# bashrc
#
# This file copied to ~/.bashrc by nkosetup.sh.

# Create a folder / file for logging all commands entered in any bash session.
mkdir -p ~/.logs

# Command to ensure all commands are logged.
# LOGIC:
# PROMPT_COMMAND is a command to run every time the shell returns to the
# command prompt. In our case, we do the following:
# IF we are not running as root (user ID is -(n)ot(e)qual-to 0...
#   THEN we append a string (return value of the date command, pwd, and
#   last entry in bash history) to a log file (named:
#   .logs/bash-history-<today's date>.log).
# Result will look like this:
#########################################################
# 2005-01-01.10:10:10 /home/woody 385 touch filename.txt
#########################################################
# First column is the date/time the command was run.
# Second column is the pwd (present working directory) in which the command
# was run.
# Third column is from the history command. It's just an index number.
# The rest will be whatever was run at the prompt.
export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'
