pushd "%GasPy%"
venv\Scripts\python -m jinja world\contentdb\templates.jinja\sumcol\interactive world\contentdb\templates\sumcol\interactive\spells
venv\Scripts\python -m jinja world\contentdb\templates.jinja\sumcol-demo world\contentdb\templates\sumcol-demo
popd
