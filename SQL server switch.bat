@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

for /F "tokens=3 delims=: " %%H in ('sc query "MSSQLSERVER" ^| findstr "        STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   net start SQLTELEMETRY$SQLEXPRESS
   net start SQLTELEMETRY
   net start MSSQL$SQLEXPRESS
   net start MSSQLSERVER
   net start SQLWriter
  )
  if /I "%%H" NEQ "STOPPED" (
   net stop SQLTELEMETRY$SQLEXPRESS
   net stop SQLTELEMETRY
   net stop MSSQL$SQLEXPRESS
   net stop MSSQLSERVER
   net stop SQLWriter
  )
)