#!/bin/bash
# nkosetup.sh
#
# This script is intended to be run on any new Ubuntu box. It installs a few
# programs and puts a few configurations in place.

# Installing Software
#
# vim - Fantastic text editor.
# rcs - Revision Control System. Sometimes useful though less and less
#       these days.
# git - Version control. Heavier than rcs but much more useful.
# screen - Use many terminals within one terminal by hitting Ctrl+a, then
#       Ctrl+<a number 0-9) to create / get to new terminals.
# *top - All of these programs are just like "top" except they have more
#       specific uses.
#      htop - NCurses process viewer.
#      atop - Load.
#      iotop - Disk I/O.
#      iftop - Network interfaces.
# nmap - Network mapper.
# rsync - Syncs files between any combo of local and remote places.
# firefox - A good, open source browser.
# sshfs - Use the SSH protocol as if it were for file shares.
sudo apt-get install \
	vim \
	rcs \
	git \
	screen \
	htop \
	atop \
	iotop \
	iftop \
	nmap \
	rsync \
	firefox \
	sshfs \
	-y

# Install updates.
sudo apt-get update
sudo apt-get upgrade -y

# Copy a few good RC / Profile file into place. This vimrc comes from our
# git repo.

echo "Copying vimrc..."
cp vimrc ~/.vimrc
echo "Copying bash_profile..."
cp bash_profile ~/.bash_profile
echo "Copying bashrc..."
cp bashrc ~/.bashrc

echo "Done processing nkosetup.sh."
