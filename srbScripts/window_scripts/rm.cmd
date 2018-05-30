@echo off

IF EXIST %1/nul (
    rmdir /s /q %1
) ELSE (
    del %1
)
