<#
.SYNOPSIS
    Uninstall Azure Az PowerShell modules.

.EXAMPLE
    PS> .\2-Uninstall-Az.ps1
#>

Function WriteLog {
    Param (
        [string] $Message,
        [switch] $Err
    )
    $LogFile = "2-Uninstall-Az.log"
    If (!(Test-Path $LogFile)) {
        New-Item $LogFile
    }
    $Now = Get-Date -Format "HH:mm:ss"
    $Line = "$Now`t$Message"
    $Line | Add-Content $LogFile -Encoding UTF8
    If ($Err) {
        Write-Host $Line -ForegroundColor Red
    } Else {
        Write-Host $Line
    }
}

WriteLog "STARTED: 2-Uninstall-Az.ps1."

WriteLog "Getting Az modules."
Get-Module -Name Az* -OutVariable ModulesMemory
Get-Module -ListAvailable -Name Az* -OutVariable ModulesInstalled

if ($ModulesMemory) {
    WriteLog "Removing Az modules."
    try {
        ($ModulesMemory | ForEach-Object {
            WriteLog "Attempting to remove module: $_"
            Remove-Module -Name $_
        })
        Remove-Module -Name Az
    } catch {
        WriteLog -Err "ERROR: Removing Az modules."
    }
} else {
    WriteLog "No Az modules to remove."
}

if ($ModulesInstalled) {
    WriteLog "Uninstalling Az modules."
    try {
        ($ModulesInstalled | ForEach-Object {
            WriteLog "Attempting to uninstall module: $_"
            Uninstall-Module -Name $_ -AllVersions
        })
        Uninstall-Module -Name Az -AllVersions
    } catch {
        WriteLog -Err "ERROR: Uninstalling Az modules."
    }
} else {
    WriteLog "No Az modules to uninstall."
}

WriteLog "COMPLETED: 2-Uninstall-Az.ps1."
WriteLog "--------------------------------------------------"