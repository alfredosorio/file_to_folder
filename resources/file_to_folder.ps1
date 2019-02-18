# Display explorer prompt and set location.
Add-Type -AssemblyName System.Windows.Forms
$location = New-Object System.Windows.Forms.FolderBrowserDialog
[void]$location.ShowDialog()
$location.SelectedPath
Set-Location -Path $location.SelectedPath

# Read all file names in the directory
$folder_names = @()
$folder_names += Get-ChildItem | % {$_.BaseName}

$file_names = @()
$file_names += gci -File -Name

For ($i = 0; $i -lt $file_names.Length; $i++) {
    # Create new directories
    New-Item -ItemType Directory -Path $folder_names[$i]
    # Move files to their corresponding directories
    Move-Item -Path $file_names[$i] -Destination $folder_names[$i]
}