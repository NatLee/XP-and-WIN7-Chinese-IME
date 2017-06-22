@Echo off
echo 刪除已安裝的舊注音 

pushd %~dp0 
@Echo Off
Set input=

:Begin
Set /P input="要刪除舊注音嗎？請輸入Y(執行)/N(離開) "
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
DEL %windir%\System32\phon.tbl /Q /F
DEL %windir%\System32\phoncode.tbl /Q /F
DEL %windir%\System32\phonptr.tbl /Q /F
DEL %windir%\System32\phonXP.ime /Q /F
DEL %windir%\System32\uniime.dll /Q /F

DEL %windir%\SysWOW64\phon.tbl /Q /F
DEL %windir%\SysWOW64\phoncode.tbl /Q /F
DEL %windir%\SysWOW64\phonptr.tbl /Q /F
DEL %windir%\SysWOW64\phonXP.ime /Q /F
DEL %windir%\SysWOW64\uniime.dll /Q /F

REG DELETE .\old_typer_ver_bat\REG.reg
Goto WIN7Option


:X86
DEL %windir%\System32\phon.tbl /Q /F
DEL %windir%\System32\phoncode.tbl /Q /F
DEL %windir%\System32\phonptr.tbl /Q /F
DEL %windir%\System32\phonXP.ime /Q /F
DEL %windir%\System32\uniime.dll /Q /F

REG DELETE /s .\old_typer_ver_bat\REG.reg
Goto WIN7Option

:WIN7Option
REG DELETE /s .\old_typer_ver_bat\Win7.reg

echo 刪除成功！
pause
Goto End

:End