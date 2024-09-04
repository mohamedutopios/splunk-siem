Pour générer des anomalies spécifiques aux logs SMTP dans un contexte de SIEM, voici des exemples de scénarios d'incidents que vous pouvez ajouter, ainsi que les requêtes pour les identifier.

### Exemples d'Anomalies SMTP à ajouter :

1. **Tentatives de Spam (envoi massif d’emails)** :
   - Un même expéditeur envoie des centaines d'emails en peu de temps à des destinataires différents, ce qui peut indiquer une tentative de spam.

2. **Tentatives d'envoi d'email à des adresses inexistantes** :
   - Tentatives répétées d’envoi d’emails à des adresses inexistantes avec une réponse `550` (erreur d'adresse).

3. **Attaques par force brute sur le serveur SMTP** :
   - Plusieurs tentatives d’authentification échouées provenant de la même adresse IP, ce qui pourrait indiquer une tentative de brute force.

4. **Email spoofing (falsification d'adresse d'expéditeur)** :
   - Des emails provenant d'adresses IP qui ne correspondent pas au domaine de l'expéditeur peuvent indiquer un email falsifié.

5. **Envoi de fichiers malveillants** :
   - Emails contenant des pièces jointes de type exécutable, qui pourraient contenir des malwares.

### Logs SMTP Anomalies à ajouter :

```plaintext
1331904024.070000 CtoBox4y93gvzs9sZb 192.168.202.79 44926 192.168.229.251 25 1 nmap.scanme.org - - - - - - - - - - - - - 221 2.0.0 Exchange.hec.net Service closing transmission channel 192.168.229.251,192.168.202.79 - (empty) F
1331902043.810000 CiH1mj1NuwWexXJJs7 192.168.202.79 45600 192.168.229.251 25 1 nmap.scanme.org - - - - - - - - - - - - - 221 2.0.0 Exchange.hec.net Service closing transmission channel 192.168.229.251,192.168.202.79 - (empty) F

1331902555.770000 C3z34H8Q8sZsq6F7D8 192.168.203.45 44845 192.168.21.102 25 1 spam@example.com - - - - - - - - - - - 554 5.7.1 Rejected due to policy - too many messages sent 192.168.21.102,192.168.203.45 - (empty) F
1331902555.780000 C3z34H8Q8sZsq6F7D9 192.168.203.45 44846 192.168.21.102 25 1 spam@example.com - - - - - - - - - - - 554 5.7.1 Rejected due to policy - too many messages sent 192.168.21.102,192.168.203.45 - (empty) F
1331902555.790000 C3z34H8Q8sZsq6F7D10 192.168.203.45 44847 192.168.21.102 25 1 spam@example.com - - - - - - - - - - - 554 5.7.1 Rejected due to policy - too many messages sent 192.168.21.102,192.168.203.45 - (empty) F

1331902555.800000 C7r94H8Q8sZsq9G7E10 192.168.210.11 45333 192.168.210.15 25 1 test@domain.com - - - - - - - - - - - 550 5.1.1 Recipient address rejected: User unknown in virtual mailbox table 192.168.210.15,192.168.210.11 - (empty) F
1331902555.810000 C7r94H8Q8sZsq9G7E11 192.168.210.11 45334 192.168.210.15 25 1 test@domain.com - - - - - - - - - - - 550 5.1.1 Recipient address rejected: User unknown in virtual mailbox table 192.168.210.15,192.168.210.11 - (empty) F

1331903999.990000 BruteQ8F2I3Kn3lC4 198.51.100.42 58765 192.168.203.45 25 1 john@example.com - - - - - - - - - - - 535 5.7.8 Authentication credentials invalid 192.168.203.45,198.51.100.42 - (empty) F
1331904000.000000 BruteQ8F2I3Kn3lC5 198.51.100.42 58766 192.168.203.45 25 1 john@example.com - - - - - - - - - - - 535 5.7.8 Authentication credentials invalid 192.168.203.45,198.51.100.42 - (empty) F
1331904000.010000 BruteQ8F2I3Kn3lC6 198.51.100.42 58767 192.168.203.45 25 1 john@example.com - - - - - - - - - - - 535 5.7.8 Authentication credentials invalid 192.168.203.45,198.51.100.42 - (empty) F

1331904080.500000 SpoofF9E7K2Lm0aC9 203.0.113.78 44444 192.168.21.45 25 1 admin@spoofeddomain.com - - - - - - - - - - - 250 2.1.5 Ok 192.168.21.45,203.0.113.78 - (empty) F
1331904080.510000 SpoofF9E7K2Lm0aC10 203.0.113.78 44445 192.168.21.45 25 1 admin@spoofeddomain.com - - - - - - - - - - - 250 2.1.5 Ok 192.168.21.45,203.0.113.78 - (empty) F

1331904255.800000 MalwareF3E9X4Po6cZ1 192.168.210.15 43232 192.168.210.20 25 1 alice@domain.com - - - malware.exe - - - - - - - - 192.168.210.20,192.168.210.15 - (empty) F
```

### Explication des anomalies :

1. **Spam** :
   - Les adresses email `spam@example.com` ont plusieurs tentatives d'envoi d'email qui ont été rejetées par la politique du serveur (`554 5.7.1 Rejected due to policy`).
   
2. **Adresses email invalides** :
   - L’adresse `test@domain.com` est inconnue dans la boîte aux lettres virtuelle du serveur, ce qui a déclenché des erreurs `550 5.1.1 User unknown`.

3. **Brute force d'authentification** :
   - Plusieurs tentatives d'authentification échouées pour `john@example.com` depuis la même adresse IP (198.51.100.42) indiquant une attaque de force brute avec l'erreur `535 5.7.8 Authentication credentials invalid`.

4. **Email Spoofing** :
   - Des emails ont été envoyés avec des adresses d’expéditeur falsifiées comme `admin@spoofeddomain.com`. Ce type de falsification peut indiquer une tentative d'usurpation d’identité.

5. **Transfert de fichiers malveillants** :
   - Un fichier exécutable potentiellement dangereux (`malware.exe`) a été transféré, ce qui pourrait contenir un logiciel malveillant.

### Requêtes Splunk pour identifier ces anomalies :

1. **Détection de Spam (rejet des emails)** :
```splunk
index=smtp_logs sourcetype=smtp 
| search smtp_code="554" AND smtp_message="Rejected due to policy"
| stats count by src_ip, dest_ip, smtp_message
```

2. **Détection d'adresses email inexistantes (User unknown)** :
```splunk
index=smtp_logs sourcetype=smtp 
| search smtp_code="550" AND smtp_message="User unknown"
| stats count by src_ip, dest_ip, smtp_code, smtp_message
```

3. **Détection de tentatives de brute force d'authentification** :
```splunk
index=smtp_logs sourcetype=smtp 
| search smtp_code="535" AND smtp_message="Authentication credentials invalid"
| stats count by src_ip, dest_ip, user
| where count > 5
```

4. **Détection de falsification d’adresses email (spoofing)** :
```splunk
index=smtp_logs sourcetype=smtp 
| search email_from="*@spoofeddomain.com"
| stats count by

 src_ip, dest_ip, email_from
```

5. **Détection de transfert de fichiers malveillants** :
```splunk
index=smtp_logs sourcetype=smtp 
| search attachment_type="application/x-dosexec"
| stats count by src_ip, dest_ip, file_name, file_type
```

Ces requêtes vous permettront d'exploiter les logs SMTP dans Splunk pour identifier des comportements anormaux et des incidents potentiels. Vous pouvez affiner les requêtes selon les types de logs que vous recevez et les règles de détection que vous souhaitez mettre en place.