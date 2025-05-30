call .\cleanup.bat
call .\generate.bat "" "vanilla"
set target=vanilla
call .\build.bat
set target=
call .\generate.bat
