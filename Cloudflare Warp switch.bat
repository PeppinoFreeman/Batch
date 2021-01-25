@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

for /F "tokens=3 delims=: " %%H in ('sc query "CloudflareWARP" ^| findstr "        STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start "CloudflareWARP"
   start "" "C:\Program Files\Cloudflare\Cloudflare WARP\Cloudflare WARP.exe" 
  )	
  if /I "%%H" NEQ "STOPPED" (
   taskkill /f /im "Cloudflare WARP.exe"
   net stop "CloudflareWARP"
  )
)
