# ══ تنظیمات پس از نصب ویندوز ══
 $ErrorActionPreference = "SilentlyContinue"

# ۱) فعال‌سازی قطعی Remote Desktop + فایروال
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 0
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name 'UserAuthentication' -Value 1
netsh advfirewall firewall add rule name="RDP-3389" dir=in action=allow protocol=TCP localport=3389 | Out-Null

# ۲) حذف نیاز به Ctrl+Alt+Del در صفحه‌ی ورود
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'DisableCAD' -Value 1

# ۳) پلن برق High Performance (سرعت بیشتر روی VM)
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

# ۴) بسته نشدن Server Manager موقع لاگین
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\ServerManager' -Name 'DoNotOpenServerManagerAtLogon' -Value 1

# ۵) نصب خودکار Google Chrome (اگر نت ویندوز قطع بود، بی‌صدا رد می‌شود)
try {
  $inst = "$env:TEMP\chrome_setup.exe"
  Invoke-WebRequest -Uri 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $inst -UseBasicParsing
  Start-Process -FilePath $inst -ArgumentList '/silent','/install' -Wait
  Remove-Item $inst -Force -ErrorAction SilentlyContinue
} catch { }
