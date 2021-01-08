@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

for /F "tokens=3 delims=: " %%H in ('sc query "MongoDb" ^| findstr "        STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start "MongoDb"
  )
  if /I "%%H" NEQ "STOPPED" (
   net stop "MongoDb"
  )
)