@echo off
git checkout %1
echo Reseteando estado de %1 al ultimo punto guardado
git fetch --all
git reset --hard origin/%1
git clean -f -d
echo Fin