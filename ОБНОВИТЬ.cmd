@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo Копирую свежую версию игры...
copy /Y "%~dp0..\dist\index.html" "%~dp0index.html" >nul || (echo Не найден dist\index.html & pause & exit /b 1)
copy /Y "%~dp0..\dist\version.json" "%~dp0version.json" >nul
if not exist "%~dp0art" mkdir "%~dp0art"
copy /Y "%~dp0..\art\*.png" "%~dp0art\" >nul
git add -A
git commit -m "Обновление"
git push
echo.
echo Готово. Через 1-2 минуты обновится: https://january495.github.io/dinasty/
pause
