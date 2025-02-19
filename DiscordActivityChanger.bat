@echo off
title Discord Activity Changer
:inicio
cls
color a
echo ========================================
echo       Discord Activity Changer
echo ========================================
echo.
echo Archivos disponibles en la carpeta:
echo ----------------------------------------

for %%F in (*.js) do echo - %%~nF

echo.
set /p archivo=Escribe el archivo Node.js a ejecutar (sin .js): 

if exist "%archivo%.js" (
    cls
    echo ==================================================
    echo Ejecutando %archivo%.js...
    echo ==================================================
    start /B node "%archivo%.js"
    goto control
) else (
    cls
    color c
    echo ==================================================
    echo   ERROR: El archivo "%archivo%.js" no existe.
    echo   Intentalo de nuevo.
    echo ==================================================
    timeout /t 2 >nul
    goto inicio
)

:control
cls
color b
echo ==================================================
echo  Node.js en ejecucion: %archivo%.js
echo ==================================================
echo.
set /p opcion=Escribe "cambiar" para detener y elegir otro archivo: 

if /I "%opcion%"=="cambiar" (
    taskkill /F /IM node.exe >nul 2>&1
    cls
    color c
    echo ==================================================
    echo       Node detenido correctamente.
    echo ==================================================
    timeout /t 2 >nul
    goto inicio
) else (
    goto control
)
