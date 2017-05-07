#Profile.ps1
#
# This script is meant to run whenever a new interactive Powershell sessions
# is started.

# Create transcript logs.
if (!(ls $env:USERPROFILE\logs -EA SilentlyContinue)) {New-Item -Name logs -Path $env:USERPROFILE -ItemType directory}
Start-Transcript -Path "$env:USERPROFILE\logs\$(get-date -UFormat %Y-%m-%d).log" -Append -NoClobber