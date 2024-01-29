# Check if running on Windows PowerShell or PowerShell Core
if ($env:OS -eq "Windows_NT" -and (Get-Command Install-WindowsFeature -ErrorAction SilentlyContinue)) {
    # Running on Windows PowerShell
    try {
        Import-Module servermanager -ErrorAction Stop
        Write-Host "The 'servermanager' module has been successfully imported."
    } catch {
        Write-Host "Error: $_"
        Write-Host "Attempting to install the required feature..."
        
        # Install the required Windows feature
        Install-WindowsFeature -Name Web-Server -IncludeManagementTools -ErrorAction Stop

        # Attempt to import the servermanager module again
        try {
            Import-Module servermanager -ErrorAction Stop
            Write-Host "The 'servermanager' module has been successfully imported after installing the required feature."
        } catch {
            Write-Host "Error: $_"
            Write-Host "Failed to resolve the issue. Additional troubleshooting is needed."
        }
    }
} else {
    # Running on PowerShell Core
    Write-Host "This script is designed for Windows PowerShell and may not work correctly in PowerShell Core."
}
