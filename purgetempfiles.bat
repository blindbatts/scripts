#**********************************************************************************************************************
# By Kevin Tansey
# Zynga IT Engineering
#**********************************************************************************************************************



@echo off   
cd /d %temp%   
for /r %%a in (*.*) do (   
del /f /q %%a   
) >nul   
cd /d "%UserProfile%\Local Settings\Temporary Internet Files   
for /r %%b in (*.*) do (   
del /f /q %%b   
) >nul   
