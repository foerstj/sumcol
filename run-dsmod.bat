chcp 65001

:: name of map
set map=sumcol-demo

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%

set target=vanilla
set ds_exe=DSMod.exe

:: Compile dsmap & dsres files
call "%bits%\build.bat" %*

::pause

:: Run it!
"%ds%\%ds_exe%" nointro=true map=%map%

:: Cleanup resources so as not to confuse Siege Editor
call "%bits%\cleanup.bat" %*
