L'installation de Splunk sur Linux et Windows diffère légèrement en fonction des systèmes d'exploitation. Voici un guide détaillé pour installer Splunk Enterprise sur les deux systèmes.

### Installation de Splunk sur Linux

1. **Télécharger Splunk Enterprise** :
   - Rendez-vous sur le [site officiel de Splunk](https://www.splunk.com/en_us/download.html) et téléchargez la version de Splunk Enterprise compatible avec votre distribution Linux. Vous pouvez choisir entre les paquets `.rpm`, `.deb`, ou l'archive `.tgz` selon votre distribution.

2. **Installation via un package (RPM/DEB)** :
   - Pour les distributions basées sur Red Hat (RHEL, CentOS, Fedora) :
     ```bash
     sudo rpm -ivh splunk-<version>.rpm
     ```
   - Pour les distributions basées sur Debian (Ubuntu, Debian) :
     ```bash
     sudo dpkg -i splunk-<version>.deb
     ```
   - Pour une installation via l'archive `.tgz`, utilisez :
     ```bash
     tar xvzf splunk-<version>.tgz -C /opt
     cd /opt/splunk
     ```

3. **Démarrage de Splunk** :
   - Accédez au répertoire d'installation de Splunk :
     ```bash
     cd /opt/splunk
     ```
   - Démarrez Splunk pour la première fois :
     ```bash
     sudo ./bin/splunk start --accept-license
     ```
   - Lors du premier démarrage, vous serez invité à accepter les termes de la licence et à créer un compte administrateur.

4. **Accéder à l'interface Web** :
   - Une fois Splunk démarré, accédez à l'interface Web de Splunk via votre navigateur à l'adresse `http://<adresse_ip_du_serveur>:8000`.
   - Connectez-vous avec les identifiants administrateur créés lors du démarrage.

5. **Configurer Splunk pour démarrer au boot** (optionnel) :
   - Pour assurer que Splunk démarre automatiquement lors du démarrage du système :
     ```bash
     sudo ./bin/splunk enable boot-start
     ```

### Installation de Splunk sur Windows

1. **Télécharger Splunk Enterprise** :
   - Rendez-vous sur le [site officiel de Splunk](https://www.splunk.com/en_us/download.html) et téléchargez le fichier d'installation pour Windows.

2. **Exécuter l'installateur** :
   - Double-cliquez sur le fichier `.msi` téléchargé pour lancer l'installation.
   - Suivez les instructions de l'assistant d'installation. Vous pouvez personnaliser le répertoire d'installation si nécessaire, ou laisser les paramètres par défaut.

3. **Configurer le compte d'administration** :
   - Pendant l'installation, il vous sera demandé de configurer un compte administrateur. Ce compte sera utilisé pour accéder à l'interface Web de Splunk.

4. **Démarrage de Splunk** :
   - Une fois l'installation terminée, Splunk démarrera automatiquement. Vous pouvez également le démarrer manuellement via le menu Démarrer.

5. **Accéder à l'interface Web** :
   - Ouvrez un navigateur Web et accédez à `http://localhost:8000` ou `http://<adresse_ip_du_serveur>:8000` si vous accédez à partir d'une autre machine.
   - Connectez-vous avec les identifiants administrateur configurés lors de l'installation.

6. **Configurer Splunk comme un service** (optionnel) :
   - Splunk est automatiquement configuré pour fonctionner en tant que service Windows, ce qui signifie qu'il démarrera automatiquement au démarrage de Windows. Vous pouvez gérer le service via l'interface "Services" de Windows ou via le "Task Manager".

### Résumé des étapes

- **Linux** :
  - Téléchargez et installez Splunk via un package ou une archive.
  - Démarrez Splunk, acceptez la licence et configurez le compte admin.
  - Accédez à l'interface Web pour commencer à utiliser Splunk.
  - (Optionnel) Configurez Splunk pour démarrer automatiquement avec le système.

- **Windows** :
  - Téléchargez et installez Splunk via l'installateur `.msi`.
  - Suivez l'assistant d'installation pour configurer le compte admin.
  - Démarrez Splunk et accédez à l'interface Web.
  - Splunk est automatiquement configuré comme un service Windows.

Ces instructions devraient vous permettre d'installer et de configurer Splunk Enterprise sur les systèmes Linux et Windows.


--> https://navyadevops.hashnode.dev/step-by-step-guide-installing-splunk-server-on-aws-linux
