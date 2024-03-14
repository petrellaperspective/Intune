# Installs (Your app) using winget
$ProgramName = "Program ID of the app as listed in winget"
## Set log path
$Path_local = "C:\ProgramData\Microsoft\IntuneManagementExtension\Logs"
Start-Transcript -Path "$Path_local\$ProgramName-install.txt" -Force -Append

# Resolve winget_exe
$winget_exe = Resolve-Path "C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe"
if ($winget_exe.count -gt 1){
$winget_exe = $winget_exe[-1].Path
}

if (!$winget_exe) {
    
    Write-Error "Winget not installed on $env:computername"

    exit 1

}

## Attempt install using Machine Scope
& $winget_exe install --exact --id $ProgramName --silent --accept-package-agreements --accept-source-agreements --scope machine

## Check if app is installed, if not then attempt install using User Scope
$wingetPrg_Existing = & $winget_exe list --id $ProgramName --exact --accept-source-agreements
if ($wingetPrg_Existing -like "*$ProgramName*"){

    Write-Output "$ProgramName is already installed!"

    exit 0

}

else{

    # Uses Winget to pull the program from the winget source and install silently on the machine for all users
    & $winget_exe install --exact --id $ProgramName --silent --accept-package-agreements --accept-source-agreements --scope machine

}

Stop-Transcript

exit 0