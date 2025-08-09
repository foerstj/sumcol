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

set dest_res=DSLOA
set target_cs=LoA

:: Compile loa spellbook support file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\global" "%tmp%\Bits\world\global" monster_types.gas
set title=%res_cs% %target_cs% - spellbook support
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\%dest_res%\%title%.dsres" -copyright "%copyright%" -title "%title%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
