@echo off
d:

set argC=0
for %%x in (%*) do Set /A argC+=1

if "%argC%" == "0" (
    cd d:\programs\gsoc\ebi\
    exit /b
    )


if "%1" == "vcf" (
    cd d:\programs\gsoc\ebi\vcf-validator\
    )

if "%1" == "demo" (
    cd d:\programs\gsoc\ebi\vcf_demo\
    exit /b
    )
if "%1" == "test" (
    cd  d:\programs\gsoc\ebi\vcf-validator\test\input_files\v4.3\srb_test
    exit /b
    )
