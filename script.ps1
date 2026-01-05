$kioskUrl = "https://fakeupdate.net/win10ue/"

Start-Process -FilePath "powershell.exe" -WindowStyle Hidden -ArgumentList @(
    "-NoProfile",
    "-ExecutionPolicy", "Bypass",
    "-Command",
    "Start-Sleep -Seconds 3; Start-Process 'msedge.exe' '--kiosk $kioskUrl --edge-kiosk-type=fullscreen --no-first-run'"
)

exit
