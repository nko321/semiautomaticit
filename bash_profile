# bash_profile
#
# Added to ~ by nkosetup.sh.

# The .bash_profile script only runs when you log INTO a bash shell.
# If you're simply starting a new shell instance (screen, xterm, etc),
# you can count on .bashrc to run instead.
# Because this differentiation is very much unimportant to my use cases,
# the following will ensure that everything in .bashrc is always run. Simpler.

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
