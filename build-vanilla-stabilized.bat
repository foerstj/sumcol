call .\cleanup.bat
call .\generate.bat "stable" "vanilla"
set target=vanilla
call .\build.bat
set target=
call .\generate.bat
