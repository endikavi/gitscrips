@echo off
echo Guardando cambios
git add *
git status
git commit -m %1
echo Subiendo Cambios
git push origin HEAD
echo Subida Correcta