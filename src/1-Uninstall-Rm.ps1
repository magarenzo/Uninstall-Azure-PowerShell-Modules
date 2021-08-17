<#
.SYNOPSIS
    Uninstall Azure Rm PowerShell modules.
.EXAMPLE
    PS> .\1-Uninstall-Rm.ps1
#>
Function WriteLog {
    Param (
        [string] $Message,
        [switch] $Err
    )
    $LogFile = "1-Uninstall-Rm.log"
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

WriteLog "STARTED: 1-Uninstall-Rm.ps1."

WriteLog "Installing Az.Accounts module to uninstall Rm modules."
Install-Module -Name Az.Accounts -Repository PSGallery -AllowClobber -Scope CurrentUser -Force

WriteLog "Uninstalling Rm modules."
Uninstall-AzureRm

WriteLog "COMPLETED: 1-Uninstall-Rm.ps1."
WriteLog "--------------------------------------------------"