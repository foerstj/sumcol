set stable=%1

pushd "%GasPy%"
venv\Scripts\python -m jinja gaspy\jinja\sumcol\main world\contentdb\templates\sumcol\interactive\spells\summon --value stable=%stable%
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\sub world\contentdb\templates\sumcol\interactive\spells\monster --value stable=%stable%
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\summons world\contentdb\templates\sumcol-demo\summons\interactive\spells\summon --value stable=%stable%
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map world\contentdb\templates\sumcol-demo --value stable=%stable%
if %errorlevel% neq 0 pause
popd
