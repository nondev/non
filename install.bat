@if "%DEBUG%" == "" @echo off
setlocal
call javac lib/launcher/*.java
call jar cvfe bin/non.jar Main -C lib/launcher/ .
call jar fu bin/non.jar lib/gradle/* lib/platforms/* lib/resources/* lib/VERSION
call luarocks make non-dev-1.rockspec
cd lib/thirdparty
call gradlew.bat install
cd ../core
call gradlew.bat install