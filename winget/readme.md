# Winget Readme

A collection of documentation on uses of winget with intune

### Winget OS required and accessing help

winget usage options can be shown with `winget -?` OR `winget --help`

winget is installed on windows device running OS build 1709 or higher but is packaged within
the Windows App installer. If you do a fresh install of Windows you'll need to trigger an update
or make sure the Windows App installer is updated to ensure winget is installed correctly after
a wipe.

### Winget file location

Winget is located at the Microsoft DesktopAppInstaller hidden directory WindowsApps.
Because the Microsoft DesktopAppInstaller will update its name based on new versions
it is recommended to use wildcards to resolve the path to winget FIRST in your script.

`C:\Program Files\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe\winget.exe"`

### Winget Limitations

Winget can only options if the app was developed with those functions. Example being 
**windirstat** does not have a silent uninstall option therefore it fails despite 
being able to install silently. 

If the installer hash does not match winget's install will not execute after download of 
the installer file. Because this varies based on the app, community reliability will vary
from app to app. 

depending on the app if it was is installed via other methods winget may not be able to see
certain options like upgrading the version. Test the application with winget on the device
with how it was installed previously to see what upgrade or update options are available
for winget to trigger. 