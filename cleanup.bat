chcp 65001
:: name of map, case-sensitive
set map_cs=Summons Collection Demo
:: name of resources, case-sensitive
set res_cs=Summons Collection
:: path of DS installation
set ds=%DungeonSiege%

set target=vanilla
set dest_res=DSLOA
set dest_map=DSLOA
if "%target%"=="vanilla" (
  set dest_res=Resources
  set dest_map=Maps
)

:: Cleanup resources so as not to confuse Siege Editor
:: all-in-one dsres
del "%ds%\%dest_res%\%res_cs%.dsres"
:: translation
del "%ds%\%dest_res%\%res_cs%.de.dsres"
:: partial builds
del "%ds%\%dest_res%\%res_cs% - *.dsres"

:: demo map
del "%ds%\%dest_res%\%map_cs%.dsres"
del "%ds%\%dest_map%\%map_cs%.dsmap"
