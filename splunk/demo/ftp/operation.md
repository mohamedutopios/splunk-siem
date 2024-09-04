Voici quelques exemples d'anomalies ou d'incidents que l'on pourrait intégrer dans un fichier FTP pour un SIEM afin de détecter des comportements inhabituels ou des risques potentiels :

1. **Tentatives de connexion échouées** (mot de passe incorrect ou tentative d'accès non autorisé).
2. **Transfert de fichiers suspects** (par exemple, des exécutables ou des fichiers qui pourraient contenir des malwares).
3. **Suppression ou modification non autorisée de fichiers sensibles** (tentatives de suppression de fichiers critiques).
4. **Utilisation d'un compte anonyme ou un compte utilisateur non autorisé pour des actions privilégiées**.
5. **Échec de commandes FTP critiques** (comme des tentatives de suppression de fichiers non autorisées).
6. **Périphérique IP inconnu ou non habituel tentant de se connecter au serveur FTP**.

Voici quelques exemples de logs FTP avec des anomalies intégrées dans un format plausible :

```plaintext
1331992750.000000    Cf39Xu2jMkNpFQ6R89    192.168.250.100    5876    192.168.25.102    21    anonymous    anonymous@domain.com    RETR    ftp://192.168.25.102/dept/sensitive_data.zip    application/zip    823467    226    Transfer complete    -    -    -    -    F9hL9F2HOgYIwm230x
1331992762.500000    C0a8q72HHgTxFD7wK3    192.168.201.45    5460    192.168.25.101    21    user    -    PASS    -    -    -    530    Login incorrect.    -    -    -    -    K7uJ3Q9Ng9EpH2QW56
1331992773.700000    CbGxPq3vVmNtH6XJ5f    192.168.202.35    6453    192.168.25.101    21    admin    -    DELE    ftp://192.168.25.101/dept/finance/reports/annual_report.xls    application/vnd.ms-excel    -    550    Delete operation failed: permission denied.    -    -    -    -    Xc0K4W9UHzTrG8M210
1331992785.200000    ChF2Pu4xTkWlQ9ZT98    192.168.240.98    5521    192.168.25.101    21    root    password    RETR    ftp://192.168.25.101/dept/system/core_dump.bin    application/octet-stream    9238471    226    Transfer complete    -    -    -    -    D7oL2M7TZcXfJ1Q630
1331992798.400000    C9x0Vr5sJpLnG3VZ91    192.168.253.200    4912    192.168.25.101    21    john.doe    johndoe@domain.com    DELE    ftp://192.168.25.101/dept/secret_files/confidential_info.docx    application/vnd.openxmlformats-officedocument.wordprocessingml.document    -    550    Operation not permitted    -    -    -    -    H4oL1T8UQyKiW5V743
1331992810.100000    CwL5Vu6xRmTzM2PS42    192.168.200.77    4875    192.168.25.102    21    guest    -    RETR    ftp://192.168.25.102/dept/logs/error_log.txt    text/plain    12365    226    Transfer complete    -    -    -    -    F7pJ9X5RNlWxQ4V120
1331992825.900000    C2p3Wr7vQlGyN4TU61    192.168.204.150    6200    192.168.25.101    21    user    -    STOR    ftp://192.168.25.101/dept/malicious/malware.exe    application/x-dosexec    625789    226    Transfer complete    -    -    -    -    K1uQ5T4OnrEhM6F890
1331992853.300000    Cf39Xu2jMkNpFQ6R89    192.168.250.100    5876    192.168.25.102    21    anonymous    anonymous@domain.com    DELE    ftp://192.168.25.102/dept/sensitive_data.zip    application/zip    -    550    Delete operation failed: permission denied.    -    -    -    -    L8jT9K7XUiNvW3M540
```

### Explication des anomalies :

1. **Tentative de suppression d'un fichier sensible** :
   - Log : `Cf39Xu2jMkNpFQ6R89` → Tentative de suppression d'un fichier `sensitive_data.zip` par un utilisateur anonyme, échec avec un code `550` (Permission denied).
   
2. **Échec d'authentification** :
   - Log : `C0a8q72HHgTxFD7wK3` → Tentative de connexion avec un mot de passe incorrect, log indiquant le code `530` (Login incorrect).
   
3. **Suppression non autorisée** :
   - Log : `CbGxPq3vVmNtH6XJ5f` → Tentative de suppression d'un fichier `.xls` dans un dossier financier, échec avec code `550` (Permission denied).
   
4. **Transfert d'un fichier suspect** :
   - Log : `ChF2Pu4xTkWlQ9ZT98` → Transfert réussi d'un fichier `core_dump.bin`, qui pourrait contenir des informations sensibles ou critiques.
   
5. **Suppression de fichiers confidentiels** :
   - Log : `C9x0Vr5sJpLnG3VZ91` → Tentative de suppression d'un fichier confidentiel `.docx`, refus avec code `550`.
   
6. **Transfert d'un fichier exécutable malveillant** :
   - Log : `C2p3Wr7vQlGyN4TU61` → Un fichier exécutable `malware.exe` est téléchargé sur le serveur FTP, ce qui est un indicateur clair d'activité suspecte.

### Requêtes SIEM associées pour détecter ces anomalies :

1. **Tentatives de connexion échouées** :
   ```splunk
   index=ftp_logs sourcetype=ftp | search response_code=530 | stats count by src_ip, user
   ```

2. **Suppression de fichiers échouée** :
   ```splunk
   index=ftp_logs sourcetype=ftp | search ftp_command=DELE response_code=550 | stats count by src_ip, file_path
   ```

3. **Transferts de fichiers suspects (fichiers exécutables)** :
   ```splunk
   index=ftp_logs sourcetype=ftp | search file_type="application/x-dosexec" | stats count by src_ip, url_path
   ```

Ces anomalies peuvent être utilisées pour surveiller les incidents potentiels et les risques dans un environnement FTP.