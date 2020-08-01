# Making sure the script is run as Admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }
cls
Cscript.exe c:\windows\system32\slmgr.vbs /ipk NF6HC-QH89W-F8WYV-WWXV4-WFG6P
$url = "https://raw.githubusercontent.com/SafeInactivity/win10upgrade/master/sub_main.cmd"
$output = "$PSScriptRoot\main.cmd"
cls
Invoke-WebRequest -Uri $url -OutFile $output
.\act.cmd
echo "Your PC will restart in 90s"
Restart-Computer -Delay 90