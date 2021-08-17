# Uninstall Azure PowerShell Modules

Uninstall Azure Rm and Az PowerShell modules.

## Description

I needed to clean up an environment so I followed Microsoft's documentation on [How to uninstall Azure PowerShell modules](https://docs.microsoft.com/en-us/powershell/azure/uninstall-az-ps?view=azps-6.3.0) and put their recommendations into two separate scripts to uninstall Rm and then Az modules along with simple logging for ease of use.

## Running the Scripts

1. Open a PowerShell session as Administrator.

2. Optionally run the following to allow the current session to run scripts not digitally signed:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

3. Run the `1-Uninstall-Rm.ps1` script. For example:

```powershell
PS> .\1-Uninstall-Rm.ps1
```

4. Close the PowerShell session.

5. Repeat steps 1. and optionally 2.

6. Run the `2-Uninstall-Az.ps1` script. For example:

```powershell
PS> .\2-Uninstall-Az.ps1
```

## Owner

[Michael A.](https://linkedin.com/in/magarenzo)
