# Attempt to import the servermanager module
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
