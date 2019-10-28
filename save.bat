@echo off
echo Saving changes...
git add *
git status
git commit -m %1
echo Uploading changes to origin
git push origin HEAD | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:resolve

echo local branch is outdated, resolving...

git pull
git push origin HEAD | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:end

echo Success