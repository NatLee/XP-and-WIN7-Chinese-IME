@Echo off
echo �ª`���w�˧妸�� 
ECHO �s�@by Nat Lee

pushd %~dp0 
@Echo Off
Set input=

:Begin
Set /P input="�n�w��XP�ª`���ܡH�п�JY(����)/N(���ܦw��WIN7�ª`��) "
If /I "%input%"=="Y" Goto check
If /I "%input%"=="N" Goto WIN7Option
Echo �����T����J�A�Э��s��J�C
Goto Begin

:check
if "%SESSIONNAME%" == "Console" goto NoAdmin
If %PROCESSOR_ARCHITECTURE% == AMD64 Goto X64
If %PROCESSOR_ARCHITECTURE% == x86 Goto X86

:NoAdmin
echo �Хk��H�޲z���Ҧ�����I
pause
Goto End

:X64
Xcopy /s/f .\old_typer_ver_bat\System32\*.* %windir%\System32
Xcopy /s/f .\old_typer_ver_bat\SysWOW64\*.* %windir%\SysWOW64
regedit /s .\old_typer_ver_bat\REG.reg
Goto WIN7Option

:X86
Xcopy /s/f .\old_typer_ver_bat\System32\*.* %windir%\System32
regedit /s .\old_typer_ver_bat\REG.reg
Goto WIN7Option

:WIN7Option
Set /P input="�n�w��WIN7�ª`���ܡH�п�JY(����)/N(���}) "
If /I "%input%"=="Y" Goto InstallWIN7Typer
If /I "%input%"=="N" Goto End

:InstallWIN7Typer
regedit /s .\old_typer_ver_bat\Win7.reg
echo �w�˦��\�A�Щ�]�w���u�ܧ��J�k�v�T�{�I
echo �Y�L�k�ϥΡA�Э��}���A���T�{�I
pause
Goto End

:End