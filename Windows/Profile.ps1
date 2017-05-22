# Create transcript logs.
if (!(Get-ChildItem $env:USERPROFILE\logs -EA SilentlyContinue)) {New-Item -Name logs -Path $env:USERPROFILE -ItemType directory}
Start-Transcript -Path "$env:USERPROFILE\logs\$(get-date -UFormat %Y-%m-%d).log" -Append -NoClobber

function get-nkoOperatingSystem () {
    return Get-WmiObject -class Win32_OperatingSystem -computername . | Select-Object Caption, OSArchitecture, ServicePackMajorVersion | Format-List
}

function invoke-nkoHTTPCheck () {
    
}

function Get-nkoRandomDigit {[char](Get-Random -Minimum 48 -Maximum 57)}function Get-nkoRandomCapital {[char](Get-Random -Minimum 65 -Maximum 90)}function Get-nkoRandomLowerCase {[char](Get-Random -Minimum 97 -Maximum 122)}function Get-nkoRandomPassword {    param([int]$MinimumLength=8,        [int]$MaximumLength=14,        [bool]$NeedsDigit=$false,        [bool]$NeedsCapital=$false,        [bool]$NeedsLowerCase=$false)    Write-Verbose "Generating random password."    Write-Verbose "MinimumLength=$MinimumLength, MaximumLength=$MaximumLength, NeedsDigit=$NeedsDigit, NeedsCapital=$NeedsCapital, NeedsLowerCase=$NeedsLowerCase."    $length = Get-Random -Minimum $MinimumLength -Maximum ($MaximumLength+1)    Write-Verbose "Password length will be $length."    $password = ""    if ($NeedsDigit) {$addition = Get-nkoRandomDigit; Write-Verbose "Generating needed Digit ($addition)."; $password += $addition; $length--}    if ($NeedsCapital) {$addition = Get-nkoRandomCapital; Write-Verbose "Generating needed Capital ($addition)."; $password += $addition; $length--}    if ($NeedsLowerCase) {$addition = Get-nkoRandomLowerCase; Write-Verbose "Generating needed LowerCase ($addition)."; $password += $addition; $length--}    while ($length -gt 0) {        $NextLetterType = Get-Random -Minimum 1 -Maximum 4        Write-Verbose "NextLetterType=$NextLetterType."        switch ($NextLetterType) {            1 {$password += Get-nkoRandomDigit}            2 {$password += Get-nkoRandomCapital}            3 {$password += Get-nkoRandomLowerCase}        }        $length--    }    return $password}