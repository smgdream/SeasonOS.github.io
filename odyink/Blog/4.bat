@echo off
title 计算圆周率-转载 (by plp626)
echo 代码源地址http://www.bathome.net/thread-3437-1-1.html
echo 相关地址
echo https://bbs.emath.ac.cn/thread-3139-1-1.html
echo https://bbs.emath.ac.cn/thread-1935-1-1.html
echo https://mathworld.wolfram.com/PiFormulas.html
echo.
setlocal enabledelayedexpansion
echo 位数最好不超过500否则计算很慢
if not %1.==. (set c=%1) else set /p c=位数:
set/a c=(c*100/3)+70,cc=c/10,count=0
for /l %%a in (1 1 %cc%)do set/a f_%%a=2000
for /l %%a in (%c% -132 100)do (set/a n=%%a/10,m=2*n-1
set/a "d=f_!n!*10000,f_!b!=d%%m,d=d/m,n-=1"
for /l %%b in (!n! -1 1)do (set/a n=%%b,m=2*n-1
   set/a "d=d*n+f_!n!*10000,f_!n!=d%%m,d=d/m,n-=1"
)
set/a "an=e+d/10000,e=d%%10000"
if !an! lss 1000 set an=000!an!
set/p=!an:~-4!<nul
)
echo\&echo/&set/p=回车退出