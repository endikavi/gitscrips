@echo off

see.bat | findstr /C:"%1"
if %errorlevel% GEQ 1 GOTO:error1

echo Uploading changes from %1 to origin
git push origin %1
git checkout master
echo Updating last master changes from origin
git pull
echo Adding changes from origin %1 to local master
git pull origin %1
echo Uploading local master to origin
git push origin master | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:resolve

echo master is outdated, resolving...
git pull origin master
git push origin master | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:error1

echo This branch no exist
GOTO:eof

:end

echo Deleting local branch
git branch -D %1
echo Deleting branch in origin
git push origin :%1
git checkout master
echo %1 Ended successfully