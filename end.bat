@echo off
echo Subiendo Cambios de %1
git push -u origin %1
echo Subida Correcta
if %ERRORLEVEL% GEQ 1 echo Error
git checkout master
echo Actualizando ultimos cambios desde Origen
git pull
echo Añadiendo cambios de %1 a master local
git pull origin %1
echo Subiendo Cambios
git push origin master
echo Borrando la Rama en local
git branch -D %1
echo Borrando la Rama en remoto
git push origin :%1
git checkout master
if %ERRORLEVEL% GEQ 1 echo Error
git pull origin master
git push origin master
echo Se ha finalizado la Rama y añadido a master correctamente
if %ERRORLEVEL% GEQ 1 echo %ERRORLEVEL%