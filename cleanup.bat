:: This script is supposed to be executed from your DS installation folder.

:: name of map, case-sensitive
set map_cs=Summons Collection Demo
:: name of resources, case-sensitive
set res_cs=Summons Collection
:: path of DS installation
set ds=.

:: Cleanup resources so as not to confuse Siege Editor
del "%ds%\DSLOA\%res_cs%.dsres"
del "%ds%\DSLOA\%map_cs%.dsres"
