::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCiDJN9yJMfr8p2iq4BZ6u5+34k4x9vH5ueGpUgPUfFxcYzUug==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCiDJN9yJMfr8p2iq4BZ6u5+34k4x9vHZyRZJZDTXfK6hF9eJ1SyqC7NbZgqfIaoKqrfZStCCQNdHg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd/d "%~dp0"

:1
cls
title ����ip��ַ By Max23 [�����]%COMPUTERNAME% [�û�]%USERNAME%
color 0A
setlocal enabledelayedexpansion
set INTERFACE_NAME=none
set IP_ADDRESS=none
set GATEWAY=192.168.1.1
set SUBNET_MASK=255.255.255.0
set DNS1=223.5.5.5
set DNS2=223.6.6.6
set GATEWAY_1=none
set SUBNET_MASK_1=none
set DNS_1=none
set CONFIRM=none

echo �˼������������ӿ�(����������)��
for /f "delims=" %%a in ('netsh interface show interface^|more +3') do (
    set "str=%%a"
    for /f "tokens=*" %%b in ("!str:~46!") do echo,%%b
)
goto :2

:2
echo.
set /p INTERFACE_NAME=��������ӿڣ�
:2_2
cls
set /p IP_ADDRESS=����IP(���磺192.168.1.2)��

cls
echo ������Ĭ�����أ�%GATEWAY%
set /p GATEWAY_1=�Զ���Ĭ�����������롰1��(�س�����)��
if not "%GATEWAY_1%" == "1" goto :3
set /p GATEWAY=������Ĭ�����أ�

goto :3

:3
cls
echo �������������룺%SUBNET_MASK%
set /p SUBNET_MASK_1=�Զ����������������롰1��(�س�����)��
if not "%SUBNET_MASK_1%" == "1" goto :4
set /p SUBNET_MASK=�������������룺

goto :4

:4
cls
echo ������DNS��%DNS1%,%DNS2%
set /p DNS_1=�Զ���DNS�����롰1��(�س�����)��
if not "%DNS_1%" == "1" goto :5
set /p DNS1=��������ѡDNS��

set /p DNS2=�����뱸��DNS��

goto :5

:5
cls
REM ��ʾ�û��������������
echo.
echo �˼������������ӿ�(����������)��
for /f "delims=" %%a in ('netsh interface show interface^|more +3') do (
    set "str=%%a"
    for /f "tokens=*" %%b in ("!str:~46!") do echo,%%b
)
echo.
echo ���������ƣ�%INTERFACE_NAME%
echo IP��ַ��%IP_ADDRESS%
echo Ĭ�����أ�%GATEWAY%
echo �������룺%SUBNET_MASK%
echo ��ѡDNS��������%DNS1%
echo ����DNS��������%DNS2%
echo.

set /p CONFIRM=ȷ��Ҫ������������������(Y/N)
if %CONFIRM% == y goto :6
if %CONFIRM% == n goto :1
goto :5

:6
cls
title ����ip��ַ By Max23 [�����]%COMPUTERNAME% [�û�]%USERNAME%  *****ҳ�濨������������1~2min*****
echo ����ʾ���������������Ե�Ƭ�̣�
netsh interface ipv4 set dns name=%INTERFACE_NAME% source=static address=%DNS1%
netsh interface ipv4 add dns name=%INTERFACE_NAME% address=%DNS2% index=2
netsh interface ip set address "%INTERFACE_NAME%" static %IP_ADDRESS% %SUBNET_MASK% %GATEWAY% 1
goto :END

:END
    cls
    echo.
    title ����ip��ַ By Max23 [�����]%COMPUTERNAME% [�û�]%USERNAME%
    ipconfig /all
    color A0
    echo.
    echo ------------------------------------------------------
    echo.
    echo ******д��ɹ�******
    echo  �Զ���д IP��ַ   Ϊ %IP_ADDRESS% �ɹ���
    echo  �Զ���д Ĭ������ Ϊ %GATEWAY% �ɹ���
    echo  �Զ���д �������� Ϊ %SUBNET_MASK% �ɹ���
    echo  �Զ���д DNS      Ϊ %DNS1% %DNS2% �ɹ���
    echo.
    echo ------------------------------------------------------
    pause
exit
