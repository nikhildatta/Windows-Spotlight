set file=.\%date%.txt
if exist %file% goto quit

del *.txt
echo n1>%file%

if "%UserProfile%\AppData\Local\Windows Spotlight" == "%cd%" goto exec

robocopy "%cd%" "%UserProfile%\AppData\Local\Windows Spotlight" *.bat *vbs
set TARGET='%UserProfile%\AppData\Local\Windows Spotlight\Master.vbs'
set SHORTCUT='%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Master.vbs.lnk'
set PWS=powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile

%PWS% -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut(%SHORTCUT%); $S.TargetPath = %TARGET%; $S.WorkingDirectory = '%UserProfile%\AppData\Local\Windows Spotlight\'; $S.Save()"
pause
exit

:exec

robocopy "..\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets" "%cd%" /min:100000
ren *. *.jpg
del *.
check.bat

:quit
set file=