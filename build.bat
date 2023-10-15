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
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsmap" -copyright "CC-BY-SA 2023" -title "%map_cs%" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Compile all-in-one resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /xf *.psd /S
robocopy "%doc_dsloa%\Bits\world\ai\jobs\%res%" "%tmp%\Bits\world\ai\jobs\%res%" /S
robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" /S
robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs%.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  :: Animals
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-an-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-an-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-an-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Animals.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Elementals
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-el-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-el-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-el-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Elementals.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Undead
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-un-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-un-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-un-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Undead.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Plants
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-pl-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-pl-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-pl-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Plants.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Demonics
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-de-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-de-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-de-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Demonics.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause


  :: Standard
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-std-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-std-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-std-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Standard.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Stationary
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-st-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-st-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-st-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Stationary.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Miniboss
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-mb-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-mb-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-mb-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Miniboss.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause


  :: Vanilla
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-v-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-v-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-v-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Vanilla.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: LoA
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-loa-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-loa-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-loa-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - LoA.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause


  :: Nature Magic
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-nm-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-nm-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-nm-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Nature Magic.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Combat Magic
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *-cm-* /xf *.psd /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%" "%tmp%\Bits\world\contentdb\templates\%res%" base-* *-cm-* /S
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" *-cm-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Combat Magic.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause
)
endlocal

:: Compile demo resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%-demo" "%tmp%\Bits\world\contentdb\templates\%res%-demo" /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%map_cs%.dsres" -copyright "CC-BY-SA 2023" -title "%map_cs%" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
