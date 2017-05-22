Function Clone-RvVmSnapshot
{
    <#
    .SYNOPSIS
        More information in the help for Clone-RvVm function.

    .DESCRIPTION
        Developer
            Developer: Rudolf Vesely, http://rudolfvesely.com/
            Copyright (c) Rudolf Vesely. All rights reserved
            License: Free for private use only

        Description
            More information in the help for Clone-RvVm function.

            Use: Get-Help Clone-RvVm
    #>

    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium'
    )]

    Param
    (
        [Parameter(
            ValueFromPipeline = $true
        )]
        [Microsoft.HyperV.PowerShell.VirtualMachine[]]
        $VmSource,
        [string[]]
        $VmSourceName,
        [Parameter(
            ValueFromPipeline = $true
        )]
        [Microsoft.HyperV.PowerShell.VMSnapshot[]]
        $VmSourceSnapshot,
        [string]
        $VmSourceSnapshotName,
        [string]
        $VmTargetName,
        # [string]
        # $ItemType = 'VM',
        [string]
        $VmTargetDirectoryName,
        [string]
        $PathDirectoryVmStorage = 'C:\VMs',
        [string]
        $PathDirectoryTemporaryData = 'C:\Temp',
        [string]
        $ComputerName = '.',
        [switch]
        $AskForVmTargetName = $false,
        [switch]
        $GenerateUniqueVmTargetName = $true,
        [switch]
        $RemoveTemporaryData = $true,
        [string[]]
        $Configuration = @('OptimizeDisk', 'DisconnectNetwork', 'StaticMacToDynamic'),
        [switch]
        $Force = $false
    )

    Process
    {
        $parametersAndArguments = $PsBoundParameters
        if (![bool]$parametersAndArguments.ItemType) { $parametersAndArguments.Add('ItemType', 'Snapshot') }
        Clone-RvVm @parametersAndArguments
    }
}