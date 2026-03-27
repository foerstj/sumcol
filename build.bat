chcp 65001

:: name of mod
set mod=sumcol
:: name of mod, case-sensitive
set mod_cs=Summons Collection
:: name of mart map
set mart_map=%mod%-mart
:: name of mart map, case-sensitive
set mart_map_cs=%mod_cs% Mart
:: name of demo map
set demo_map=%mod%-demo
:: name of demo map, case-sensitive
set demo_map_cs=%mod_cs% Demo

:: tank properties
set year=2026
set copyright=CC-BY-SA %year%
set author=Johannes Förstner

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

if "%target%"=="" (
  set target=loa
)
set dest_res=DSLOA
set dest_map=DSLOA
if "%target%"=="vanilla" (
  set dest_res=Resources
  set dest_map=Maps
)

set target_cs=
if "%target%"=="vanilla" (
  set target_cs=Vanilla
)
if "%target%"=="loa" (
  set target_cs=LoA
)

:: Compile main resource files - split by DS version + functional type std/non-std
call :build_partial "std-v" "KoE+UP Standard"
call :build_partial2 "v" "std" "KoE+UP Non-Standard"
call :build_partial "yh" "Yesterhaven"
if "%target%"=="loa" (
  call :build_partial "std-loa" "LoA Standard"
  call :build_partial2 "loa" "std" "LoA Non-Standard"
)
:: extensions
call :build_partial_x "guards" "Guards"

:: Compile translation all-in-one resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\language" "%tmp%\Bits\language" %mod%-*.de.gas /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%mod_cs%.de.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile mart map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%mart_map%" "%tmp%\Bits\world\maps\%mart_map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_map%\%mart_map_cs%.dsmap" -copyright "%copyright%" -title "%mart_map_cs%" -author "%author%"
if %errorlevel% neq 0 pause
:: Compile mart resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates\%mart_map%" "%tmp%\Bits\world\contentdb\templates\%mart_map%" /S
robocopy "%bits%\world\global\moods\%mart_map%" "%tmp%\Bits\world\global\moods\%mart_map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%mart_map_cs%.dsres" -copyright "%copyright%" -title "%mart_map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile demo map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%demo_map%" "%tmp%\Bits\world\maps\%demo_map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_map%\%demo_map_cs%.dsmap" -copyright "%copyright%" -title "%demo_map_cs%" -author "%author%"
if %errorlevel% neq 0 pause
:: Compile demo resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates\%demo_map%" "%tmp%\Bits\world\contentdb\templates\%demo_map%" /S
robocopy "%bits%\world\global\moods\%demo_map%" "%tmp%\Bits\world\global\moods\%demo_map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%demo_map_cs%.dsres" -copyright "%copyright%" -title "%demo_map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"

exit /b %errorlevel%


:: Subroutines

:: build partial, including infix
:build_partial
  set infix=%~1
  set name=%~2
  echo build_partial %infix% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-%infix%-* /xf *-x-* /xf *.psd /S
  robocopy "%bits%\world\ai\jobs\%mod%" "%tmp%\Bits\world\ai\jobs\%mod%" /S
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" common-* *-%infix%-* /xd x /xf *-x-* /S
  robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" *-%infix%-* /xf *-x-* /S
  set title=%mod_cs% %target_cs% - %name% Creatures
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%title%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0

:: build partial, including one infix and excluding another
:build_partial2
  set infix_incl=%~1
  set infix_excl=%~2
  set name=%~3
  echo build_partial2 %infix_incl% %infix_excl% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-%infix_incl%-* /xf *-%infix_excl%-* /xf *-x-* /xf *.psd /S
  robocopy "%bits%\world\ai\jobs\%mod%" "%tmp%\Bits\world\ai\jobs\%mod%" /S
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" common-* *-%infix_incl%-* /xf *-%infix_excl%-* /xd x /xf *-x-* /S
  robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" *-%infix_incl%-* /xf *-%infix_excl%-* /xf *-x-* /S
  set title=%mod_cs% %target_cs% - %name% Creatures
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%title%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0

:: build extension
:build_partial_x
  set infix_x=%~1
  set name_x=%~2
  echo build_partial_x %infix_x% %name_x%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-x-%infix_x%-* /xf *.psd /S
  robocopy "%bits%\world\ai\jobs\%mod%" "%tmp%\Bits\world\ai\jobs\%mod%" /S
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%bits%\world\contentdb\templates\%mod%" "%tmp%\Bits\world\contentdb\templates\%mod%" common-* *-x-%infix_x%-* /S
  robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" *-x-%infix_x%-* /S
  set title=%mod_cs% %target_cs% Extension - %name_x%
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%title%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0
