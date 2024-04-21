:: This script is supposed to be executed from your DS installation folder.
:: TankCreator is expected to be in a sibling dir.

:: name of map
set map=sumcol-demo
:: name of map, case-sensitive
set map_cs=Summons Collection Demo
:: name of resources
set res=sumcol
:: name of resources, case-sensitive
set res_cs=Summons Collection
:: tank properties
set year=2024
set copyright=CC-BY-SA %year%
set author=Johannes Förstner

:: path of DSLOA documents dir (where Bits are)
set doc_dsloa=%USERPROFILE%\Documents\Dungeon Siege LoA
:: path of DS installation
set ds=.
:: path of TankCreator
set tc=..\TankCreator

:: param
set mode=%1
echo %mode%

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile all-in-one resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /xf *.psd /S
robocopy "%doc_dsloa%\Bits\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /S
robocopy "%doc_dsloa%\Bits\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" /S
robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs%.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile translation resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\language" "%tmp%\Bits\language" %res%-*.de.gas /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs%.de.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
if %errorlevel% neq 0 pause

if "%mode%"=="release" (
  :: by creature type
  call :build_partial "an" "Animals"
  call :build_partial "el" "Elementals"
  call :build_partial "un" "Undead"
  call :build_partial "pl" "Plants"
  call :build_partial "de" "Demonics"
  call :build_partial "ro" "Robots"
  call :build_partial "hu" "Humanoids"

  :: by functional type
  call :build_partial "std" "Standard"
  call :build_partial "st" "Stationary"
  call :build_partial "mb" "Miniboss"
  call :build_partial "ex" "Explosive"
  call :build_partial "heal" "Heal"

  :: by DS version
  call :build_partial "v" "Vanilla"
  call :build_partial "loa" "LoA"

  :: by mage class
  call :build_partial "nm" "Nature Magic"
  call :build_partial "cm" "Combat Magic"
)

:: Compile demo resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%-demo" "%tmp%\Bits\world\contentdb\templates\%res%-demo" /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

exit /b %errorlevel%

:: Subroutines

:build_partial
  set infix=%~1
  set name=%~2
  echo build_partial %infix% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-%infix%-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" common-* *-%infix%-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-%infix%-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - %name%.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0
