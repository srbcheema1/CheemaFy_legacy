@echo off
set argC=0
for %%x in (%*) do Set /A argC+=1

if "%argC%" == "0" (
    vcvarsall amd64
    ) else (
    vcvarsall %1
     )
