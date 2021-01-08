@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

for /F "tokens=3 delims=: " %%H in ('sc query "com.docker.service" ^| findstr "        STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start "com.docker.service"
   net start "vmcompute"
   net start "vmms"
  )
  if /I "%%H" NEQ "STOPPED" (
   net stop "com.docker.service"
   net stop "vmcompute" 
   net stop "vmms"
  )
)
