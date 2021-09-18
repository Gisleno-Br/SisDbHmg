@echo off
if %1. == . goto MissingParameter
if %1. == debug.   goto GoodParameter
if %1. == release. goto GoodParameter

echo You must send "debug" or "release" as parameter
goto End

:GoodParameter

echo Compilando..





set PATH=D:\Harbour64\bin\win\mingw64;D:\MINGW64\bin;%PATH%;D:\Hmg
set HB_COMPILER=mingw64
set HB_PATH=D:\Harbour64

if %1 == debug (
	   echo Debug Compilacao.
		Build64 /n /b SisDbHmg.Hbp SisDbHmg.Hbc hbmySql.Hbc
		rem Hbmk2 SisDbHmg.Hbp SisDbHmg.Hbc -b
		
		del SisDbHmg.exe
		Ren b.exe SisDbHmg.exe
) else (
	  echo Normal
		Build64 /n SisDbHmg.Hbp SisDbHmg.Hbc hbmySql.Hbc
		rem Ren n.exe SisDbHmg.exe


)


goto End
:MissingParameter
echo Missing Parameter
:End
