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
Get-InstalledModule -Name Az -AllVersions -OutVariable AzVersions
if ($AzVersions) {
    try {
        ($AzVersions | ForEach-Object {
            Import-Clixml -Path (Join-Path -Path $_.InstalledLocation -ChildPath PSGetModuleInfo.xml)
        }).Dependencies.Name | Sort-Object -Descending -Unique -OutVariable AzModules
    } catch {
        WriteLog -Err "ERROR: Getting Az modules."
    }

    WriteLog "Uninstalling Az modules."
    try {
        $AzModules | ForEach-Object {
            Remove-Module -Name $_ -ErrorAction SilentlyContinue
            WriteLog "Attempting to uninstall module: $_"
            Uninstall-Module -Name $_ -AllVersions
          }
          Remove-Module -Name Az -ErrorAction SilentlyContinue
          Uninstall-Module -Name Az -AllVersions
    } catch {
        WriteLog -Err "ERROR: Uninstalling Az modules."
    }
} else {
    WriteLog "No Az modules to uninstall."
}

WriteLog "COMPLETED: 2-Uninstall-Az.ps1."
WriteLog "--------------------------------------------------"