@echo off
goto start

::What this .bat does-

::Checks for administrator permissions by seeing if we can use `net session`
::then installs ScpVBus

:start
echo Administrative permissions required. Checking permissions...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrative permissions denied. Launch as an Administrator!
    goto exit
)

cd %~dp0

echo Installing WinUSB drivers for known gamepads (this might take a minute or two)
wdi-simple --vid 0xCafe --pid 0x4005 --iid 0 --type 0 --name "8BitGeist XAdapter XID"

echo Driver installation complete!
:exit
pause
