# nkosetup.ps1
#
# This script is intended to be run on every new computer to set things up
# just the way we like them.

# Move the Profile.ps1 file into place so that Powershell will always start
# the way we want it to start.
if (!(ls $env:USERPROFILE\Documents\WindowsPowerShell -EA SilentlyContinue)) {New-Item -Name $env:USERPROFILE\Documents\WindowsPowerShell -Path $env:USERPROFILE -ItemType directory}
Copy-Item .\Profile.ps1 $env:userprofile\Documents\

function get-nkouptime () { Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime }

function get-nkodate () { get-date -UFormat %Y-%m-%d }

function get-nkooperatingsystem { (Get-WmiObject -class Win32_OperatingSystem).caption }