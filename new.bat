@echo off
echo Updating master from origin
git checkout master
git pull origin master
echo Creating new branch named %1
git checkout -b %1 master
echo Success