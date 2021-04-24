@echo off
echo Updating to newest version of mod pack....
echo.
echo Any items listed below have been changed since your last update
echo The letter in the first column indicates the type of change
echo 'A' added, 'C' Conflicted (you edited something, modpack update also edited it)
echo 'D' Deleted, 'M' Modified, 'U' Updated, 'R' Replaced
echo.
echo Conflicted files (marked C) will be replaced to ensure modpack functions.
echo.
cd %~dp0
IF NOT EXIST "..\..\..\svn\svn.exe" goto :error_svn_missing
..\..\..\svn\svn.exe update --accept=tf
IF %ERRORLEVEL% NEQ 0 goto :error_svn
echo.
echo Modpack updates should be complete. Resuming game start...
timeout 2
goto :eof

:error_svn_missing
echo.
echo ERROR: SVN is missing. Did you forget to unzip the modpack to it's own folder and put the whole folder into the Instances folder, or deleted the SVN folder?
pause
EXIT

:error_svn
echo.
echo ERROR: Something went wront with the SVN updater tool.
pause
EXIT

:eof