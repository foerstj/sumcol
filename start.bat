:: name of map
set map=sumcol-demo

:: path of DS installation
set ds=%DungeonSiege%

set target=loa
set ds_exe=DSLOA.exe
if "%target%"=="vanilla" (
  set ds_exe=DungeonSiege.exe
)

:: Run it!
"%ds%\%ds_exe%" nointro=true map=%map%
