@echo off

see.bat | findstr /C:"%1"
if %errorlevel% GEQ 1 GOTO:error1

echo Subiendo Cambios de %1
git checkout master
echo Actualizando ultimos cambios desde Origen
git pull
echo Añadiendo cambios de %1 a master local
git pull origin %1
echo Subiendo Cambios
git push origin master | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:resolve

echo Se han encontrado cambios en master remoto
git pull origin master
git push origin master | findstr /C:"failed"

if %errorlevel% == 0 GOTO:resolve

GOTO:end

:error1

echo La rama especificada no existe
GOTO:eof

:end

echo Borrando la Rama en local
git branch -D %1
echo Borrando la Rama en remoto
git push origin :%1
git checkout master
echo Se ha finalizado la Rama y añadido a master correctamente