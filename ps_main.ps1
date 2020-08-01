# Making sure the script is run as Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }
cls
# sets generic win10 pro key
Cscript.exe c:\windows\system32\slmgr.vbs /ipk NF6HC-QH89W-F8WYV-WWXV4-WFG6P
# downloads the activation script to the same folder as the main powershell script and runs it
$url = "https://raw.githubusercontent.com/SafeInactivity/win10upgrade/master/sub_main.cmd"
$output = "$PSScriptRoot\main.cmd"
cls
Invoke-WebRequest -Uri $url -OutFile $output
.\main.cmd
echo "Your PC will restart in 90s"
tart-Sleep -Seconds 90 ; Restart-Computer -Force
