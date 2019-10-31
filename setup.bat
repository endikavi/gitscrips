@echo off
echo Setup for the new repo:

set /p pathr= Repo local path?

:begin

set /p op= New or Clone(N/C):

if "%op%"=="N" goto op1
if "%op%"=="C" goto op2
if "%op%"=="n" goto op1
if "%op%"=="c" goto op2

goto begin

:op1

git init %pathr%

GOTO End

:op2

set /p Url= Repo Url?
git clone %Url%

GOTO End

:End

echo Made New Repo in %pathr%

cd "%cd%\%pathr%"

echo you can now start working