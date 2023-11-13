# PowerShell script to open port 8080 on the local firewall

# Define the port to open
$port = 8080

# Rule name
$ruleName = "CustomRule_Port_$port"

# Check if the rule already exists
$existingRule = Get-NetFirewallRule -DisplayName $ruleName -ErrorAction SilentlyContinue

if ($null -eq $existingRule) {
    # Rule does not exist, create it
    New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Action Allow -Protocol TCP -LocalPort $port
    Write-Host "Created firewall rule for port $port"
} else {
    Write-Host "Firewall rule for port $port already exists"
}

Write-Host "Script execution completed."
