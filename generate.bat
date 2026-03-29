set stable=%1
set vanilla=%2

:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
:: SumCol main
venv\Scripts\python -m jinja gaspy\jinja\sumcol\main world\contentdb\templates\sumcol\interactive\spells\summon --for-each gaspy\jinja\sumcol\main\main.csv --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\monster-spells world\contentdb\templates\sumcol\interactive\spells\monster --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\monster-weapons world\contentdb\templates\sumcol\interactive\weapons --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\monster-actors world\contentdb\templates\sumcol\actors\evil --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\sub world\contentdb\templates\sumcol\interactive\spells\monster --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
if %errorlevel% neq 0 pause
:: readme
venv\Scripts\python -m jinja gaspy\jinja\sumcol\readme "" --for-all gaspy\jinja\sumcol\main\main.csv --bits "%bits%"
if %errorlevel% neq 0 pause
:: translations
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-loa-nstd.de.gas.csv --value v=loa --value ft=nstd --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-loa-std.de.gas.csv --value v=loa --value ft=std --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-v-nstd.de.gas.csv --value v=v --value ft=nstd --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-v-std.de.gas.csv --value v=v --value ft=std --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language --for-all gaspy\jinja\sumcol\language\sumcol-yh-all.de.gas.csv --value v=yh --value ft=all --bits "%bits%"
if %errorlevel% neq 0 pause

:: SumCol extensions
setlocal enableDelayedExpansion
for %%x in (guards originals) do (
  venv\Scripts\python -m jinja gaspy\jinja\sumcol\main world\contentdb\templates\sumcol\x\%%x\interactive\spells\summon "{{sos}}-summon-x-{{x}}-{{mc}}-{{ct}}-{{ft}}-{{v}}-{{stn}}.gas" --for-each gaspy\jinja\sumcol\main\x-%%x.csv --value x=%%x --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m jinja gaspy\jinja\sumcol\language language "sumcol-x-{{x}}.de.gas" --for-all gaspy\jinja\sumcol\language\sumcol-x-%%x.de.gas.csv --value x=%%x --bits "%bits%"
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m jinja gaspy\jinja\sumcol\readme "" "CREATURES - {{x | upper}}.md" --for-all gaspy\jinja\sumcol\main\x-%%x.csv --value x=%%x --bits "%bits%"
  if !errorlevel! neq 0 pause
)
endlocal

:: SumCol Mart map
venv\Scripts\python -m jinja gaspy\jinja\sumcol-mart\mart-content.gas.jinja world\contentdb\templates\sumcol-mart --for-all gaspy\jinja\sumcol\main\main.csv --bits "%bits%"
if %errorlevel% neq 0 pause
setlocal enableDelayedExpansion
for %%x in (guards originals) do (
  venv\Scripts\python -m jinja gaspy\jinja\sumcol-mart\mart-content-x.gas.jinja world\contentdb\templates\sumcol-mart "mart-content-x-{{x}}.gas" --for-all gaspy\jinja\sumcol\main\x-%%x.csv --value "x=%%x" --bits "%bits%"
  if !errorlevel! neq 0 pause
)
endlocal
venv\Scripts\python -m jinja gaspy\jinja\sumcol-mart\mart-content-originals.gas.jinja world\contentdb\templates\sumcol-mart --for-all gaspy\jinja\sumcol-mart\originals.csv --bits "%bits%"
if %errorlevel% neq 0 pause

:: SumCol demo/test map
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\summons world\contentdb\templates\sumcol-demo\summons\interactive\spells\summon --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\monster-spells world\contentdb\templates\sumcol-demo\summons\interactive\spells\monster --value stable=%stable% --value vanilla=%vanilla% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\scroll-spells world\contentdb\templates\sumcol-demo\summons\interactive\spells\summon --for-all gaspy\jinja\sumcol\main\main.csv --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\scroll-spells world\contentdb\templates\sumcol-demo\summons\interactive\spells\summon "scroll-spells-x.gas" --for-all gaspy\jinja\sumcol\main\x-guards.csv gaspy\jinja\sumcol\main\x-originals.csv --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\companions world\contentdb\templates\sumcol-demo --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\sumcol.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main\main.csv --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
setlocal enableDelayedExpansion
for %%x in (guards originals) do (
  venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\sumcol-x.gas.jinja world\contentdb\templates\sumcol-demo\containers "sumcol-x-{{x}}.gas" --for-all gaspy\jinja\sumcol\main\x-%%x.csv --value "x=%%x" --bits "%bits%"
  if !errorlevel! neq 0 pause
)
endlocal
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\scroll-spells.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main\main.csv --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\scroll-spells-x.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main\x-guards.csv gaspy\jinja\sumcol\main\x-originals.csv --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\test-only.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main\main.csv --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja gaspy\jinja\sumcol-demo\map\containers\test-only-x.gas.jinja world\contentdb\templates\sumcol-demo\containers --for-all gaspy\jinja\sumcol\main\x-guards.csv gaspy\jinja\sumcol\main\x-originals.csv --value stable=%stable% --bits "%bits%"
if %errorlevel% neq 0 pause
popd
