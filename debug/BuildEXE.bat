@echo off
if %1. == . goto MissingParameter
if %1. == debug.   goto GoodParameter
if %1. == release. goto GoodParameter

echo You must send "debug" or "release" as parameter
goto End

:GoodParameter


set PATH=C:\hmg\HARBOUR\bin;C:\hmg\MINGW\bin;%PATH%;c:\Hmg
set HB_COMPILER=mingw
set HB_PATH=C:\Hmg\Harbour
echo Compilando..

C:
cd\sisDbHmg
Cd %1

if %1 == debug (
   echo Debug Compilacao.
	..\Build /b /n SisDbHmg.Hbp SisDbHmg.Hbc
) else (
  echo Normal
	..\Build /c /n SisDbHmg.Hbp SisDbHmg.Hbc
)


goto End
:MissingParameter
echo Missing Parameter
:End
