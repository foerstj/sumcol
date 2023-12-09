:: This script is supposed to be executed from your DS installation folder.

:: name of map, case-sensitive
set map_cs=Summons Collection Demo
:: name of resources, case-sensitive
set res_cs=Summons Collection
:: path of DS installation
set ds=.

:: Cleanup resources so as not to confuse Siege Editor
:: all-in-one dsres
del "%ds%\DSLOA\%res_cs%.dsres"
:: translation
del "%ds%\DSLOA\%res_cs%.de.dsres"

:: by creature type
del "%ds%\DSLOA\%res_cs% - Animals.dsres"
del "%ds%\DSLOA\%res_cs% - Elementals.dsres"
del "%ds%\DSLOA\%res_cs% - Undead.dsres"
del "%ds%\DSLOA\%res_cs% - Plants.dsres"
del "%ds%\DSLOA\%res_cs% - Demonics.dsres"
:: by functional type
del "%ds%\DSLOA\%res_cs% - Standard.dsres"
del "%ds%\DSLOA\%res_cs% - Stationary.dsres"
del "%ds%\DSLOA\%res_cs% - Miniboss.dsres"
del "%ds%\DSLOA\%res_cs% - Explosive.dsres"
:: by DS version
del "%ds%\DSLOA\%res_cs% - Vanilla.dsres"
del "%ds%\DSLOA\%res_cs% - LoA.dsres"
:: by mage class
del "%ds%\DSLOA\%res_cs% - Nature Magic.dsres"
del "%ds%\DSLOA\%res_cs% - Combat Magic.dsres"

:: demo map
del "%ds%\DSLOA\%map_cs%.dsres"
del "%ds%\DSLOA\%map_cs%.dsmap"
