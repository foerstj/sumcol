set stable=%1

:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m jinja gaspy\jinja\sumcol\main world\contentdb\templates\sumcol\interactive\spells\summon --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\sub world\contentdb\templates\sumcol\interactive\spells\monster --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause

venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-loa-nstd.de.gas.csv --value v=loa --value ft=nstd --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-loa-std.de.gas.csv --value v=loa --value ft=std --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-v-nstd.de.gas.csv --value v=v --value ft=nstd --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-v-std.de.gas.csv --value v=v --value ft=std --bits "%bits%"
if %errorlevel% neq 0 pause

venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\summons world\contentdb\templates\sumcol-demo\summons\interactive\spells\summon --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\scroll-spells world\contentdb\templates\sumcol-demo\summons\interactive\spells\summon --for-all gaspy\jinja\sumcol\main --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\companions world\contentdb\templates\sumcol-demo --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\sumcol.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\scroll-spells.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\test-only.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
popd
