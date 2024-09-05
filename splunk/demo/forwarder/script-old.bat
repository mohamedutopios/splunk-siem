@echo off

REM Adresse IP de la VM
set VM_IP=192.168.1.113
REM Utilisateur pour se connecter à la VM
set VM_USER=mohamed
REM Message à écrire dans le fichier sur la VM distante
set MESSAGE="Ceci est un message de test envoyé depuis Splunk!"
REM Fichier texte cible sur la VM distante
set TARGET_FILE="/home/%VM_USER%/test_message.txt"

REM Exécuter la commande SSH pour écrire dans le fichier texte
ssh -i C:\Users\mohamed\.ssh\id_rsa mohamed@192.168.1.113 "echo 'Ceci est un message de test' >> /home/mohamed/testo_message.txt"
