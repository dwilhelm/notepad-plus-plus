@echo off

set SRCROOT=%~d0%~p0..
echo Set repo root path to %SRCROOT%

if not defined DevEnvDir (
    echo Setting up dev environment
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
)
cd %SRCROOT%

echo Compiling notepad++.exe
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\amd64\MSBuild.exe" ^
    .\PowerEditor\visual.net\notepadPlus.vcxproj ^
    /t:rebuild /p:Configuration="Unicode Release" /v:normal /maxcpucount

echo Compiling SciLexer.dll
pushd .\scintilla\win32
nmake NOBOOST=1 -f scintilla.mak
popd
copy .\scintilla\bin\SciLexer.dll .\PowerEditor\bin64\
