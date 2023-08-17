:: This script is supposed to be executed from your DS installation folder.
:: TankCreator is expected to be in a sibling dir.

:: name of map
set map=sumcol-demo
:: path of DSLOA documents dir (where Bits are)
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator

:: Compile dsmap & dsres files
call "%doc_dsloa%\Bits\build.bat" %*

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=%map%

:: Cleanup resources so as not to confuse Siege Editor
call "%doc_dsloa%\Bits\cleanup.bat" %*
