@echo off
mode con cp select=65001
setlocal EnableExtensions DisableDelayedExpansion
set "SourceDir=C:\Downloads"
for /F "eol=| delims=" %%I in ('dir "%SourceDir%\pruefvermerk.xml" /A-D /B /S 2^>nul') do (
    set "Betreff="
    for /F "tokens=2,3* delims=</>" %%A in ('%SystemRoot%\System32\findstr.exe /R "<Betreff>[^<][^<]*</Betreff>" "%%I"') do (
        if "%%A" == "Betreff" if not defined Betreff set "Betreff=%%B"
    )
    if defined Betreff (
        set "FilePath=%%~dpI"
        setlocal EnableDelayedExpansion
        echo !FilePath:~0,-1!| %SystemRoot%\System32\findstr.exe /E /I /L /C:" [!Betreff!]" >nul
        for %%J in ("!FilePath:~0,-1!") do if not exist "!Betreff! %%~J" ren "%%~J" "!Betreff! %%~nxJ"
        endlocal
    )
)
endlocal