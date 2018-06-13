@echo off

if "%1" == "-f" (
    if "%2" == "*" (
        echo "deleting everything"
        for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
        exit /b
    )
)

IF EXIST %1/nul (
    rmdir /s /q %1
) ELSE (
    del %1
)
