@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

E:
cd E:/Logiciels/Jenkins

for /F "tokens=3 delims=: " %%H in ('sc query "jenkins" ^| findstr "        STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start "jenkins"
  )
  if /I "%%H" NEQ "STOPPED" (
   net stop "jenkins" 
  )
)
