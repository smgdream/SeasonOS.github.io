@echo off
title 电视直播
color 02
if exist .\Blog\exptmp\ rd /s /q .\Blog\exptmp
mkdir .\Blog\exptmp >nul
timeout /t 2 /nobreak >nul
if exist .\wget.exe copy .\wget.exe .\Blog\exptmp\wget.exe
if exist ..\wget.exe copy ..\wget.exe .\Blog\exptmp\wget.exe
    cd /d .\Blog\exptmp
echo 下载所需软件
    PowerShell Invoke-WebRequest https://smgdata-1302226504.cos.accelerate.myqcloud.com/wget.exe -outfile wget.exe >nul
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
title 电视直播
:back
cls
echo 1.CCTV 1
echo 2.翡翠台
echo q.退出(全屏播放也是如此)
echo 请输入有效序号
set /p tvnum=序号:
if "%tvnum%"=="1" ffplay -fs -threads 16 "rtmp://58.200.131.2:1935/livetv/cctv1hd"
if "%tvnum%"=="2" ffplay -fs -threads 16 "http://116.199.5.52:8114/00000000/index.m3u8?&amp;Fsv_ctype=LIVES&amp;Fsv_otype=1&amp;FvSeid=5abd1660af1babb4&amp;Fsv_filetype=1&amp;Fsv_ctype=LIVES&amp;Fsv_cid=0&amp;Fsv_chan_hls_se_idx=188&amp;Fsv_rate_id=0&amp;Fsv_SV_PARAM1=0&amp;Fsv_ShiftEnable=0&amp;Fsv_ShiftTsp=0&amp;Provider_id=&amp;Pcontent_id=&amp;Fsv&amp;_res_tag_=video"
if /i "%tvnum%"=="q" (
    cd ..\
    rd /s /q .\exptmp
    cd ..\
    goto :eof
)
goto :back