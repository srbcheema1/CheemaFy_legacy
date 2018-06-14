@echo off
if "%1" == ".." (
    cd ..
    exit /b
    )

IF EXIST %1/nul (
    cd %1
) ELSE (
    "C:\Program Files (x86)\Vim\vim81\vim.exe" "%1"
)
