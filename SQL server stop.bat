@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

net stop SQLTELEMETRY$SQLEXPRESS
net stop SQLTELEMETRY
net stop MSSQL$SQLEXPRESS
net stop MSSQLSERVER
net stop SQLWriter