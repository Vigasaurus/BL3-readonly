@echo off

mkdir "C:\\Users\\%username%\\BL3 Read-Only Toggle"
copy readonly.bat "C:\\Users\\%username%\\BL3 Read-Only Toggle\\readonly.bat"

cd "C:\\Users\\%username%\\BL3 Read-Only Toggle"

rm readonly-context.reg
echo Windows Registry Editor Version 5.00>> readonly-context.reg
echo. >> readonly-context.reg
echo [HKEY_CLASSES_ROOT\.sav]>> readonly-context.reg
echo @="savefile">> readonly-context.reg
echo ; Add Verb>> readonly-context.reg
echo [HKEY_CURRENT_USER\Software\Classes\savefile\shell\ToggleReadOnly]>> readonly-context.reg
echo @="Toggle Read-Only">> readonly-context.reg
echo [HKEY_CURRENT_USER\Software\Classes\savefile\shell\ToggleReadOnly\command]>> readonly-context.reg
echo @="\"C:\\Users\\%username%\\BL3 Read-Only Toggle\\readonly.bat\" \"%%1\"">> readonly-context.reg
echo [HKEY_CURRENT_USER\Software\Classes\savefile\shell\ToggleReadOnly]>> readonly-context.reg
echo "Icon"=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,00,\>> readonly-context.reg
echo   5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,53,00,48,00,45,\>> readonly-context.reg
echo   00,4c,00,4c,00,33,00,32,00,2e,00,64,00,6c,00,6c,00,2c,00,32,00,33,00,34,00,\>> readonly-context.reg
echo   00,00>> readonly-context.reg

readonly-context.reg

echo Installed.
pause
