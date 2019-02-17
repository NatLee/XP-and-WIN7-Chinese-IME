@Echo off
echo 刪除已安裝的舊注音 

pushd %~dp0 
@Echo Off
Set input=

:Begin
Set /P input="要刪除所有舊注音嗎？請輸入Y(是)/N(否) "
If /I "%input%"=="Y" Goto check
If /I "%input%"=="N" Goto End
Echo 不正確的輸入，請重新輸入。
Goto Begin

:check
if "%SESSIONNAME%" == "Console" goto NoAdmin
If %PROCESSOR_ARCHITECTURE% == AMD64 Goto X64
If %PROCESSOR_ARCHITECTURE% == x86 Goto X86

:NoAdmin
echo 請右鍵以管理員模式執行！
pause
Goto End

:X64
DEL %windir%\SysWOW64\phon.tbl /Q /F
DEL %windir%\SysWOW64\phoncode.tbl /Q /F
DEL %windir%\SysWOW64\phonptr.tbl /Q /F
DEL %windir%\SysWOW64\phonXP.ime /Q /F
DEL %windir%\SysWOW64\uniime.dll /Q /F

:X86
DEL %windir%\System32\phon.tbl /Q /F
DEL %windir%\System32\phoncode.tbl /Q /F
DEL %windir%\System32\phonptr.tbl /Q /F
DEL %windir%\System32\phonXP.ime /Q /F
DEL %windir%\System32\uniime.dll /Q /F

REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\E0010404" /va
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\CTF\TIP\{B115690A-EA02-48D5-A231-E3578D2FDF80}\LanguageProfile\0x00000404\{761309DE-317A-11D4-9B5D-0080C882687E}" /va

echo 刪除成功！
echo 請檢查輸入法，若有問題請重新啟動電腦！
pause

:End