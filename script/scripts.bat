@echo off

REM Adresse IP de la VM
set VM_IP=192.168.1.113
REM Utilisateur pour se connecter à la VM
set VM_USER=mohamed
REM Fichier texte cible sur la VM distante
set TARGET_FILE="/home/%VM_USER%/brute.txt"

REM Chemin du fichier de log pour la journalisation
set BLOCK_LOG=C:\Users\mohamed\Documents\block\demo.txt


:: Vérifier si une adresse IP a été passée en argument
if "%~1"=="" (
    echo Usage: block_ip.bat <IP_ADDRESS>
    exit /b 1
)
:: Lire chaque ligne du fichier CSV et bloquer les IP
for /f "tokens=1 delims=," %%A in (%1) do (
    set IP_ADDRESS=%%A

    :: Vérifier si l'IP a déjà été bloquée
    findstr /i "%IP_ADDRESS%" "%BLOCK_LOG%" >nul
    if %errorlevel% neq 0 (
        :: Bloquer l'IP via SSH
        echo Tentative de blocage de l'IP %IP_ADDRESS%

        "C:\Program Files\Git\usr\bin\ssh.exe" -o StrictHostKeyChecking=no -i C:\Users\mohamed\.ssh\id_rsa %VM_USER%@%VM_IP% "sudo iptables -A INPUT -s %IP_ADDRESS% -j DROP"

        :: Vérifier si la commande a réussi
        if %errorlevel% neq 0 (
            echo Erreur lors du blocage de l'adresse IP %IP_ADDRESS%.
        ) else (
            echo L'adresse IP %IP_ADDRESS% a été bloquée avec succès.
            :: Enregistrer l'IP bloquée dans le fichier de log
            echo %IP_ADDRESS% >> "%BLOCK_LOG%"
        )
    ) else (
        echo L'adresse IP %IP_ADDRESS% est déjà bloquée.
    )
)
