@echo off

echo Setting up dev environment
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"

echo Compiling
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\amd64\MSBuild.exe" ^
    .\PowerEditor\visual.net\notepadPlus.vcxproj ^
    /t:rebuild /p:Configuration="Unicode Release" /v:normal /maxcpucount