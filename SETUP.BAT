@Echo off
echo 舊注音安裝批次檔 
ECHO 製作by Nat Lee

pushd %~dp0 
@Echo Off
Set input=

:Begin
Set /P input="要安裝XP舊注音嗎？請輸入Y(是)/N(否) "
If /I "%input%"=="Y" Goto check
If /I "%input%"=="N" Goto WIN7Option
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
Xcopy /s/f .\old_typer_ver_bat\SysWOW64\*.* %windir%\SysWOW64
:X86
Xcopy /s/f .\old_typer_ver_bat\System32\*.* %windir%\System32
regedit /s .\old_typer_ver_bat\REG.reg

Set /P input="要安裝WIN7舊注音嗎？請輸入Y(是)/N(否) "
If /I "%input%"=="N" Goto End

regedit /s .\old_typer_ver_bat\Win7.reg
echo 安裝成功，請於設定中「變更輸入法」確認！
echo 若無法使用，請重開機再次確認！
pause

:End