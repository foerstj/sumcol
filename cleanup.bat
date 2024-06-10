chcp 65001
:: name of map, case-sensitive
set map_cs=Summons Collection Demo
:: name of resources, case-sensitive
set res_cs=Summons Collection
:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
:: all-in-one dsres
del "%ds%\DSLOA\%res_cs%.dsres"
:: translation
del "%ds%\DSLOA\%res_cs%.de.dsres"
:: partial builds
del "%ds%\DSLOA\%res_cs% - *.dsres"

:: demo map
del "%ds%\DSLOA\%map_cs%.dsres"
del "%ds%\DSLOA\%map_cs%.dsmap"
