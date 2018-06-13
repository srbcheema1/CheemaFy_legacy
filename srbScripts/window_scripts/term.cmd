@echo off
set argC=0
for %%x in (%*) do Set /A argC+=1

if "%argC%" == "0" (
    start cmd.exe
) else (
    if "%1" == "dev" (
        start %comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat"
    ) else (
        start cmd.exe
        exit
    )
)
