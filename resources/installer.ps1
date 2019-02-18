# Build shortcut object
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("File To Folder.lnk")
$psPath = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
$appPath = '-ExecutionPolicy Bypass -File' + " " + """$(Get-Location)\resources\file_to_folder.ps1"""
$Shortcut.TargetPath = $psPath
$Shortcut.Arguments = $appPath
# $Shortcut.IconLocation = "$home\Online Media Butler\resources\icon.ico"
$Shortcut.Save()