chcp 65001

:: name of map
set map=sumcol-demo
:: name of map, case-sensitive
set map_cs=Summons Collection Demo
:: name of resources
set res=sumcol
:: name of resources, case-sensitive
set res_cs=Summons Collection

:: tank properties
set year=2025
set copyright=CC-BY-SA %year%
set author=Johannes Förstner

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

:: param
set mode=%1
echo %mode%

if "%target%"=="" (
  set target=loa
)
set dest_res=DSLOA
set dest_map=DSLOA
if "%target%"=="vanilla" (
  set dest_res=Resources
  set dest_map=Maps
)

:: Compile map file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\%map%" "%tmp%\Bits\world\maps\%map%" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_map%\%map_cs%.dsmap" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Compile all-in-one resource file
if "%target%"=="loa" (
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /xf *.psd /S
  robocopy "%bits%\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /S
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%bits%\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" /S
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%res_cs%.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
  if %errorlevel% neq 0 pause
)
if "%target%"=="vanilla" (
  call :build_partial "v" "Vanilla"
)

:: Compile translation resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\language" "%tmp%\Bits\language" %res%-*.de.gas /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%res_cs%.de.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
if %errorlevel% neq 0 pause

if "%mode%"=="release" (
  :: by DS version + functional type std/non-std
  call :build_partial "std-v" "Vanilla Standard"
  call :build_partial "std-loa" "LoA Standard"
  call :build_partial2 "v" "std" "Vanilla Non-Standard"
  call :build_partial2 "loa" "std" "LoA Non-Standard"
)

:: Compile demo resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\contentdb\templates\%res%-demo" "%tmp%\Bits\world\contentdb\templates\%res%-demo" /S
robocopy "%bits%\world\global\moods" "%tmp%\Bits\world\global\moods" /S
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%map_cs%.dsres" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
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
  robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-%infix%-* /xf *.psd /S
  robocopy "%bits%\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /S
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%bits%\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" common-* *-%infix%-* /S
  robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" *-%infix%-* /S
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%res_cs% - %name%.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0

:: build partial, excluding infix
:build_partial_x
  set infix=%~1
  set name=%~2
  echo build_partial_x %infix% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /xf *-%infix%-* /xf *.psd /S
  robocopy "%bits%\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /S
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%bits%\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" /xf *-%infix%-* /S
  robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" /xf *-%infix%-* /S
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%res_cs% - %name%.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0

:: build partial, including one infix and excluding another
:build_partial2
  set infix_incl=%~1
  set infix_excl=%~2
  set name=%~3
  echo build_partial2 %infix_incl% %infix_excl% %name%
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%bits%\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-%infix_incl%-* /xf *-%infix_excl%-* /xf *.psd /S
  robocopy "%bits%\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /S
  robocopy "%bits%\world\contentdb\components" "%tmp%\Bits\world\contentdb\components" /S
  robocopy "%bits%\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" common-* *-%infix_incl%-* /xf *-%infix_excl%-* /S
  robocopy "%bits%\world\global\effects" "%tmp%\Bits\world\global\effects" *-%infix_incl%-* /xf *-%infix_excl%-* /S
  "%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%res_cs% - %name%.dsres" -copyright "%copyright%" -title "%res_cs%" -author "%author%"
  if %errorlevel% neq 0 pause
exit /b 0
