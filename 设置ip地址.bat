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
title 设置ip地址 By Max23 [计算机]%COMPUTERNAME% [用户]%USERNAME%
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

echo 此计算机所有网络接口(适配器名称)：
for /f "delims=" %%a in ('netsh interface show interface^|more +3') do (
    set "str=%%a"
    for /f "tokens=*" %%b in ("!str:~46!") do echo,%%b
)
goto :2

:2
echo.
set /p INTERFACE_NAME=输入网络接口：
:2_2
cls
set /p IP_ADDRESS=键入IP(例如：192.168.1.2)：

cls
echo 已输入默认网关：%GATEWAY%
set /p GATEWAY_1=自定义默认网关请输入“1”(回车跳过)：
if not "%GATEWAY_1%" == "1" goto :3
set /p GATEWAY=请输入默认网关：

goto :3

:3
cls
echo 已输入子网掩码：%SUBNET_MASK%
set /p SUBNET_MASK_1=自定义子网掩码请输入“1”(回车跳过)：
if not "%SUBNET_MASK_1%" == "1" goto :4
set /p SUBNET_MASK=请输入子网掩码：

goto :4

:4
cls
echo 已输入DNS：%DNS1%,%DNS2%
set /p DNS_1=自定义DNS请输入“1”(回车跳过)：
if not "%DNS_1%" == "1" goto :5
set /p DNS1=请输入首选DNS：

set /p DNS2=请输入备用DNS：

goto :5

:5
cls
REM 显示用户输入的网络配置
echo.
echo 此计算机所有网络接口(适配器名称)：
for /f "delims=" %%a in ('netsh interface show interface^|more +3') do (
    set "str=%%a"
    for /f "tokens=*" %%b in ("!str:~46!") do echo,%%b
)
echo.
echo 适配器名称：%INTERFACE_NAME%
echo IP地址：%IP_ADDRESS%
echo 默认网关：%GATEWAY%
echo 子网掩码：%SUBNET_MASK%
echo 首选DNS服务器：%DNS1%
echo 备用DNS服务器：%DNS2%
echo.

set /p CONFIRM=确认要设置以下网络配置吗？(Y/N)
if %CONFIRM% == y goto :6
if %CONFIRM% == n goto :1
goto :5

:6
cls
title 设置ip地址 By Max23 [计算机]%COMPUTERNAME% [用户]%USERNAME%  *****页面卡顿是正常现象1~2min*****
echo 【提示】报错是正常的稍等片刻！
netsh interface ipv4 set dns name=%INTERFACE_NAME% source=static address=%DNS1%
netsh interface ipv4 add dns name=%INTERFACE_NAME% address=%DNS2% index=2
netsh interface ip set address "%INTERFACE_NAME%" static %IP_ADDRESS% %SUBNET_MASK% %GATEWAY% 1
goto :END

:END
    cls
    echo.
    title 设置ip地址 By Max23 [计算机]%COMPUTERNAME% [用户]%USERNAME%
    ipconfig /all
    color A0
    echo.
    echo ------------------------------------------------------
    echo.
    echo ******写入成功******
    echo  自动填写 IP地址   为 %IP_ADDRESS% 成功！
    echo  自动填写 默认网关 为 %GATEWAY% 成功！
    echo  自动填写 子网掩码 为 %SUBNET_MASK% 成功！
    echo  自动填写 DNS      为 %DNS1% %DNS2% 成功！
    echo.
    echo ------------------------------------------------------
    pause
exit
