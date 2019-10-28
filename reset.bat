@echo off
git checkout %1
echo Reseting %1 from last commit on origin
git fetch --all
git reset --hard origin/%1
git clean -f -d
echo Success