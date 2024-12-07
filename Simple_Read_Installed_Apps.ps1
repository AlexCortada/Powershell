# Author: Alex Cortada
# Description: A simple PowerShell script to list currently installed applications and their install locations, used to identify apps for adding to the Applocker whitelist
# Date: 08.01.2024
# Version: 2024.08.01-1.0

# Script begins here

# Function to get installed applications from a specified registry path
function Get-InstalledApplications {
    param (
        [string]$RegistryPath
    )

    Get-ChildItem $RegistryPath | ForEach-Object {
        Get-ItemProperty $_.PsPath
    } | Select-Object DisplayName, InstallLocation | Sort-Object DisplayName -Descending
}

# Retrieve and display all installed applications (64-bit and 32-bit on a 64-bit system)
$installedApps64 = Get-InstalledApplications -RegistryPath 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
$installedApps32 = Get-InstalledApplications -RegistryPath 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

$installedApps64
$installedApps32

# Most of the applications will be added via Publisher. If not, we can use hash / thumbprint but then the rule itself needs to be updated for every upgraded version of that application.
# If that top one doesn't work, use this one in PoSh.

# Additional retrieval in case the previous methods don't work (if necessary)
$additionalApps = Get-InstalledApplications -RegistryPath 'HKLM:\SOFTWARE\Microsoft\Windows\Currentversion\Uninstall\*'
$additionalApps

