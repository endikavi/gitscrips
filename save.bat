@echo off
echo Guardando cambios
git add *
git status
git commit -m %1
echo Subiendo Cambios
git push origin HEAD | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:resolve

echo Se han encontrado cambios en remoto

git pull
git push origin HEAD | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:end

echo Subida Correcta