@echo off
setlocal enabledelayedexpansion

REM Chemin du dossier contenant les vidéos
set "folder=videos"

REM Fichier de sortie JSON
set "output=videos.json"

REM Initialisation du fichier JSON
echo [ > "%output%"

REM Compteur pour gérer les virgules entre les entrées
set count=0

REM Boucle à travers les fichiers vidéo (ajoutez ou modifiez les extensions si nécessaire)
for %%f in ("%folder%\*") do (
    echo    "%%~nxf", >> "%output%"
)

REM Fermeture du tableau et de l'objet JSON
echo ] >> "%output%"

echo JSON file created : %output%
echo Don't forget to remove the last comma in the array.
pause