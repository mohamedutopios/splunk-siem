@echo off

REM Adresse IP de la VM
set VM_IP=192.168.1.113
REM Utilisateur pour se connecter à la VM
set VM_USER=mohamed
REM Message à écrire dans le fichier sur la VM distante
set MESSAGE="Ceci est un message de test envoyé depuis Splunk3!"
REM Fichier texte cible sur la VM distante
set TARGET_FILE="/home/%VM_USER%/test_message.txt"

REM Chemin du fichier de log pour la journalisation
set LOG_FILE=C:\Users\mohamed\Documents\lolo\demo.txt

REM Exécuter la commande SSH pour écrire dans le fichier texte avec suppression de la vérification de clé
"C:\Program Files\Git\usr\bin\ssh.exe" -o StrictHostKeyChecking=no -i C:\Users\mohamed\.ssh\id_rsa %VM_USER%@%VM_IP% "echo %MESSAGE% >> %TARGET_FILE%" >> %LOG_FILE% 2>&1

REM Vérifier le code de retour pour savoir si la commande SSH a réussi
if %errorlevel% neq 0 (
    echo [ERROR] Le script SSH a échoué. Voir le fichier journal pour plus de détails. >> %LOG_FILE%
    exit /b 1
) else (
    echo [SUCCESS] Le script SSH s'est exécuté avec succès! >> %LOG_FILE%
)

REM C:\Program Files\Splunk\bin\scripts