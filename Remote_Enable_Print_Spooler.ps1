# Author: Alex Cortada
# Description: A crazy simple Powershell script that enables the print spooler service on a given machine.
# Date: 08.01.2024
# Version: 2024.08.01

# Script begins here


$service_name = "Spooler"
Set-Service -StartupType Automatic $service_name
Start-Service $service_name
