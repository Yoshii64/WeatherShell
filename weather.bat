@echo off
IF EXIST "C:\Program Files\WindowsApps\Microsoft.Paint_11.2205.9.0_x64__8wekyb3d8bbwe\PaintApp\mspaint.exe" goto :menu

:menu
cls
cd %UserProfile%\Desktop
mkdir weatherstuff
echo type in Radar for Radar sites
echo type in MJO for MJO
echo type in ATLSSTA for ATL sea surface anomolies
echo type in clean to delete any files the script has downloaded
set /p message0=
if %message0% == Radar goto :radar
if %message0% == ATLSSTA goto :ATLSSTA
if %message0% == MJO goto :MJO
if %message0% == clean goto :clean

:radar
echo TBW (Tampa Bay) Radar
echo MLB (Melborune) Radar
echo AMX (Miami) Radar
echo BYX (Florida Keys) Radar
echo JAX (Jacksonville) Radar
echo TLH (Tallahassee) Radar
echo EVX (Eglin AFB) Radar
set /p message1= 
if %message1% == TBW goto :TBW
if %message1% == MLB goto :MLB
if %message1% == AMX goto :AMX
if %message1% == BYX goto :BYX
if %message1% == JAX goto :JAX
if %message1% == TLH goto :TLH
if %message1% == EVX goto :EVX

:TBW
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://radar.weather.gov/ridge/lite/KTBW_loop.gif -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\TBWRadar.png"
cd "%UserProfile%\Desktop\weatherstuff"
TBWRadar.png
goto :menu

:MLB
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://radar.weather.gov/ridge/lite/KMLB_loop.gif -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\MLBRadar.png"
cd "%UserProfile%\Desktop\weatherstuff"
MLBRadar.png
goto :menu


:AMX
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://radar.weather.gov/ridge/lite/KAMX_loop.gif -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\AMXRadar.png"
cd "%UserProfile%\Desktop\weatherstuff"
AMXRadar.png
goto :menu


:BYX
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://radar.weather.gov/ridge/lite/KBYX_loop.gif -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\BYXRadar.png"
cd "%UserProfile%\Desktop\weatherstuff"
BYXRadar.png
goto :menu


:JAX
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://radar.weather.gov/ridge/lite/KJAX_loop.gif -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\JAXRadar.png"
cd "%UserProfile%\Desktop\weatherstuff"
JAXRadar.png
goto :menu


:TLH
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://radar.weather.gov/ridge/lite/KTLH_loop.gif -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\TLHRadar.png"
cd "%UserProfile%\Desktop\weatherstuff"
TLHRadar.png
goto :menu



:EVX
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://radar.weather.gov/ridge/lite/KEVX_loop.gif -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\EVXRadar.png"
cd "%UserProfile%\Desktop\weatherstuff"
EVXRadar.png
goto :menu

:ATLSSTA
powerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://cyclonicwx.com/data/sst/crw_ssta_natl.png -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\ATLSSTAs.png"
cd %UserProfile%\Desktop\weatherstuff
ATLSSTAs.png
goto :menu

:MJO
PowerShell.exe -ExecutionPolicy Unrestricted -Command "Invoke-WebRequest https://www.atmos.albany.edu/student/ventrice/real_time/twc_globe_mjo_vp200.png -OutFile C:\Users\$env:USERNAME\Desktop\weatherstuff\MJO.png"
cd %UserProfile%\Desktop\weatherstuff
MJO.png
goto :menu

:clean
cd %UserProfile%\Desktop
DEL weatherstuff *.*
rmdir /s "weatherstuff"
goto :menu