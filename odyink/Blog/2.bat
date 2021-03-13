@echo off
title Batch Exp
color 02
if exist .\Blog\exptmp\ rd /s /q .\Blog\exptmp
mkdir .\Blog\exptmp >nul
if exist .\wget.exe copy .\wget.exe \Blog\exptmp\wget.exe
    cd /d .\Blog\exptmp
echo for Windows 10 x64
echo 欢迎来到odyink的Batch示例
rem echo CScript脚本解释器 指定对象说话 "说话内容(女声)" 到 peak0.vbs
    echo CreateObject("SAPI.SpVoice").Speak "欢迎来到odyink的Batch示例">speak0.vbs
    .\speak0.vbs
pause
cls
echo 下载所需软件
    if not exist .\wget.exe PowerShell Invoke-WebRequest https://smgdata-1302226504.cos.accelerate.myqcloud.com/wget.exe -outfile wget.exe >nul
    wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/7z.exe
    rem wget -P(大写)指定目录 ./下载目录 https://smgdata-1302226504.cos.accelerate.myqcloud.com/7z.exe链接
    wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/7z.dll
    wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/ffplay.7z
cls
echo 解压文件中
rem 7z e解压 ffplay.7z解压目标
7z e ffplay.7z
echo 设置音频输出
set SDL_AUDIODRIVER=directsound
cls
echo 回车播放音频
Pause >nul
rem ffplay -autoexit播放完毕自动退出 music.mp3播放目标
ffplay -autoexit https://smgdata-1302226504.cos.accelerate.myqcloud.com/music.mp3
cls
echo 回车播放视频
Pause >nul
wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/mv.mp4
ffplay -fs -autoexit mv.mp4
cls
echo 回车退出
Pause >nul
cd ..\
rd /s /q .\exptmp
cd ..\
goto :eof