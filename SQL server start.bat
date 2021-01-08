@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

net start MSSQLSERVER
net start MSSQL$SQLEXPRESS
net start SQLTELEMETRY
net start SQLTELEMETRY$SQLEXPRESS
net start SQLWriter