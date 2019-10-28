@echo off
echo Updating Changes in %1 to origin
git push -u origin %1 | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:resolve

echo %1 is outdated, resolving...
git pull origin %1
git push origin %1 | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:end

echo Success