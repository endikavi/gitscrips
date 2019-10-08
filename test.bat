@echo off

see.bat | findstr /C:"%1"

if %errorlevel% GEQ 1 GOTO:eof

echo encontrado

echo off
:begin
echo Select a task:
echo =============
echo -
echo 1) Option 1
echo 2) Option 2
echo 3) Option 3
echo 4) Option 4
echo -
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4

echo Please Pick an option:
goto begin


:op1
echo you picked option 1
goto begin

:op2
echo you picked option 2
goto begin

:op3
echo you picked option 3
goto begin

:op4
echo you picked option 4
goto begin

:exit
@exit


:: #^d::Run "C://Users/Brad/Downloads"

@ECHO OFF
CLS
ECHO 1.Restart
ECHO 2.Shutdown
ECHO 3.Close all Windows
ECHO 4.Log off
ECHO 5.Switch User
ECHO.

CHOICE /C 12345 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 5 GOTO SwitchUser
IF ERRORLEVEL 4 GOTO Logoff
IF ERRORLEVEL 3 GOTO CloseAllWindows
IF ERRORLEVEL 2 GOTO Shutdown
IF ERRORLEVEL 1 GOTO Restart

:Restart
ECHO Restart (put your restart code here)
GOTO End

:Shutdown
ECHO Shutdown (put your shutdown code here)
GOTO End

:CloseAllWindows
ECHO Close All Windows (put your close all windows code here)
GOTO End

:Logoff
ECHO Logoff (put your log off code here)
GOTO End

:SwitchUser
ECHO Switch User (put your switch user code here)
GOTO End

:End