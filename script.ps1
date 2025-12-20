# Create a background script block
$scriptBlock = {
    Start-Sleep -Seconds 10
    Start-Process "https://www.youtube.com"
}

# Run in background job
$job = Start-Job -ScriptBlock $scriptBlock

# Exit immediately - job continues running
Exit
