@echo off

ping %1 | findstr /C:"0%"

echo %errorlevel%
