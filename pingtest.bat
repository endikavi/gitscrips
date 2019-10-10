@echo off

ping %1 | findstr /C:"0%"

echo %errorlevel%

if %errorlevel% == 1 (

echo 0

GOTO:eof

)

echo 1

