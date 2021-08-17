# Remove Azure PowerShell Modules

Remove Azure Rm and Az PowerShell modules.

## Description

Found this nifty PowerShell cmdlet `Copy-VMFile` to copy a file to a virtual machine, so I put it inside this script with parameters and simple logging for ease of use.

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
