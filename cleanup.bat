chcp 65001

:: name of map, case-sensitive
set map_cs=Summons Collection Demo
:: name of resources, case-sensitive
set res_cs=Summons Collection

:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
:: partial builds
del "%ds%\DSLOA\%res_cs% LoA - *.dsres"
:: translation
del "%ds%\DSLOA\%res_cs%.*.dsres"
:: demo map
del "%ds%\DSLOA\%map_cs%.dsres"
del "%ds%\DSLOA\%map_cs%.dsmap"

:: Same for Vanilla
:: partial builds
del "%ds%\Resources\%res_cs% Vanilla - *.dsres"
:: translation
del "%ds%\Resources\%res_cs%.*.dsres"
:: demo map
del "%ds%\Resources\%map_cs%.dsres"
del "%ds%\Maps\%map_cs%.dsmap"
