set stable=%1

pushd "%GasPy%"
venv\Scripts\python -m jinja world\contentdb\templates.jinja\sumcol\interactive world\contentdb\templates\sumcol\interactive\spells\summon --value stable=%stable%
venv\Scripts\python -m jinja world\contentdb\templates.jinja\sumcol-demo world\contentdb\templates\sumcol-demo --value stable=%stable%
popd
