:: name of mod, case-sensitive
set mod_cs=Summons Collection
:: name of mart map, case-sensitive
set mart_map_cs=%mod_cs% Mart
:: name of demo map, case-sensitive
set demo_map_cs=%mod_cs% Demo

:: path of DS installation
set ds=%DungeonSiege%

:: Cleanup resources so as not to confuse Siege Editor
:: partial builds
del "%ds%\DSLOA\%mod_cs% LoA - *.dsres"
:: translation
del "%ds%\DSLOA\%mod_cs%.*.dsres"
:: mart map
del "%ds%\DSLOA\%mart_map_cs%.dsres"
del "%ds%\DSLOA\%mart_map_cs%.dsmap"
:: demo map
del "%ds%\DSLOA\%demo_map_cs%.dsres"
del "%ds%\DSLOA\%demo_map_cs%.dsmap"

:: Same for Vanilla
:: partial builds
del "%ds%\Resources\%mod_cs% Vanilla - *.dsres"
:: translation
del "%ds%\Resources\%mod_cs%.*.dsres"
:: mart map
del "%ds%\Resources\%mart_map_cs%.dsres"
del "%ds%\Maps\%mart_map_cs%.dsmap"
:: demo map
del "%ds%\Resources\%demo_map_cs%.dsres"
del "%ds%\Maps\%demo_map_cs%.dsmap"
