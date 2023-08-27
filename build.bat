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
robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /S /xf *.psd
for %%C in (common, animals, elementals, undead, plants) do (
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xd stationary /xd miniboss
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" /S
)
robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-* /S
%tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs%.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
if %errorlevel% neq 0 pause

setlocal EnableDelayedExpansion
if "%mode%"=="release" (
  :: Animals
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *_animal_* /S /xf *.psd
  for %%C in (common, animals) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xd stationary /xd miniboss
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" /S
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-*animals-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Animals.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Elementals
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *_elemental_* /S /xf *.psd
  for %%C in (common, elementals) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xd stationary /xd miniboss
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" /S
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-*elementals-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Elementals.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Undead
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *_undead_* /S /xf *.psd
  for %%C in (common, undead) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xd stationary /xd miniboss
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" /S
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-*undead-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Undead.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Plants
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *_plant_* /S /xf *.psd
  for %%C in (common, plants) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xd stationary /xd miniboss
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" /S
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-*plants-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Plants.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause


  :: Standard
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /S /xf *_stationary_* /xf *_miniboss_* /xf *.psd
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\common" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  for %%C in (animals, elementals, undead, plants) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xd stationary /xd miniboss
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" /S /xf *-stationary-* /xf *-miniboss-*
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Standard.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Stationary
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *_stationary_* /S /xf *.psd
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\common" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  for %%C in (animals, elementals, undead, plants) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-stationary-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Stationary.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: Miniboss
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *_miniboss_* /S /xf *.psd
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\common" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  for %%C in (animals, elementals, undead, plants) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-miniboss-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Miniboss.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause


  :: Vanilla
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" /S /xf *_loa_* /xf *.psd
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\common" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  for %%C in (animals, elementals, undead, plants) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xd stationary /xd miniboss /xf loa-* /xf *-loa-*
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xf loa-* /xf *-loa-*
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" /S /xf loa-* /xf *-loa-*
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" /S /xf *-loa-*
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - Vanilla.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
  if !errorlevel! neq 0 pause

  :: LoA
  rmdir /S /Q "%tmp%\Bits"
  robocopy "%doc_dsloa%\Bits\art\bitmaps\gui" "%tmp%\Bits\art\bitmaps\gui" *_loa_* /S /xf *.psd
  robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\common" "%tmp%\Bits\world\contentdb\templates\%res%" /S
  for %%C in (animals, elementals, undead, plants) do (
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C" "%tmp%\Bits\world\contentdb\templates\%res%" loa-* *-loa-* /S /xd stationary /xd miniboss
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\stationary" "%tmp%\Bits\world\contentdb\templates\%res%" loa-* *-loa-* /S
    robocopy "%doc_dsloa%\Bits\world\contentdb\templates\%res%\%%C\miniboss" "%tmp%\Bits\world\contentdb\templates\%res%" loa-* *-loa-* /S
  )
  robocopy "%doc_dsloa%\Bits\world\global\effects" "%tmp%\Bits\world\global\effects" %res%-*-loa-* /S
  %tc%\RTC.exe -source "%tmp%\Bits" -out "%ds%\DSLOA\%res_cs% - LoA.dsres" -copyright "CC-BY-SA 2023" -title "%res_cs%" -author "Johannes Förstner"
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
