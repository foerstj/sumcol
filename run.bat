chcp 65001
:: name of map
set map=sumcol-demo
:: path of DSLOA documents dir (where Bits are)
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=%DungeonSiege%

set target=vanilla
set ds_exe=DSLOA.exe
if "%target%"=="vanilla" (
  set ds_exe=DungeonSiege.exe
)

:: Compile dsmap & dsres files
call "%doc_dsloa%\Bits\build.bat" %*

::pause

:: Run it!
"%ds%\%ds_exe%" nointro=true map=%map%

:: Cleanup resources so as not to confuse Siege Editor
call "%doc_dsloa%\Bits\cleanup.bat" %*
