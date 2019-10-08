@echo off
echo Actualizando datos desde Origen
git checkout master
git pull origin master
echo Creando nueva rama %1
git checkout -b %1 master
echo Creada, ya puedes hacer cambios