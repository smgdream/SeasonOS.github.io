@echo off
title 开根号(逼近法)
    setlocal enabledelayedexpansion
    set /p ip=根号(正整数小于42亿):
    set n=0
    set dot=0
    echo 正在计算(越大越久)
    echo.
    :start
    set /a nxn=!n!*!n!
    if !nxn!==!ip! (
        echo !n!
        goto :stop
    )
    set /a njo=!n!-1
    if !nxn! lss 0 goto :stop
    if !nxn! gtr !ip! (
        if !njo! lss !ip! (
            if !dot!==0 (
                set /p output=!njo!<nul
            ) else (
                set /p output=!njo:~-1!<nul
            )
            if !dot!==0 set /p output=.<nul
            set /a dot=!dot!+1
            set /a ip=!ip!*100
            set /a n=!njo!*10
            goto :start
        )
    )
    set /a n=!n!+1
    goto :start
    :stop
    echo.
    echo.
    set /p exit=回车退出
exit