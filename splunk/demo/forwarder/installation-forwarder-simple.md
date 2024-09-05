Pour configurer une VM **Linux** qui envoie des logs à une VM **Windows** qui contient **Splunk** pour analyse, vous pouvez suivre les étapes suivantes. Ce processus implique de configurer un **forwarder Splunk** sur la VM Linux et de le faire pointer vers la VM Windows où Splunk est installé en tant que serveur principal.

### Étapes à suivre

### 1. **Installer Splunk Universal Forwarder sur la VM Linux**

Le **Splunk Universal Forwarder** est un agent léger qui envoie les logs depuis la VM Linux vers le Splunk Indexer (votre VM Windows).

#### a. Téléchargez le Splunk Universal Forwarder

1. Accédez au site officiel de Splunk pour télécharger le **Universal Forwarder** :
   [Splunk Universal Forwarder Downloads](https://www.splunk.com/en_us/download/universal-forwarder.html)

2. Sélectionnez la version adaptée à votre système d'exploitation Linux (par exemple, Ubuntu, CentOS, etc.).

#### b. Installez le Splunk Universal Forwarder

1. Connectez-vous à la VM Linux via SSH et téléchargez le package avec `wget` ou `curl`.
   
   Exemple pour une distribution **Ubuntu/Debian** :

   ```bash
   wget -O splunkforwarder.deb "https://download.splunk.com/products/universalforwarder/releases/x.x.x/linux/splunkforwarder-x.x.x-linux-2.6-amd64.deb"
   sudo dpkg -i splunkforwarder.deb
   ```

   Exemple pour **CentOS/RHEL** :

   ```bash
   wget -O splunkforwarder.rpm "https://download.splunk.com/products/universalforwarder/releases/x.x.x/linux/splunkforwarder-x.x.x-linux-2.6-x86_64.rpm"
   sudo rpm -ivh splunkforwarder.rpm
   ```

2. Après l'installation, lancez le Splunk Universal Forwarder :

   ```bash
   sudo /opt/splunkforwarder/bin/splunk start --accept-license
   ```

3. Configurez Splunk pour démarrer automatiquement au démarrage de la machine :

   ```bash
   sudo /opt/splunkforwarder/bin/splunk enable boot-start
   ```

#### c. Configurer l'accès d'administration

Lors du démarrage de Splunk pour la première fois, vous devrez configurer l'accès d'administration en créant un utilisateur et un mot de passe pour la gestion du forwarder.

### 2. **Configurer le Splunk Universal Forwarder pour envoyer les logs**

Vous devez configurer l'Universal Forwarder pour qu'il envoie les logs spécifiques (par exemple, des logs systèmes ou des applications) à la VM Windows où Splunk est installé.

#### a. Configurer l'indexeur Splunk (VM Windows) comme destination

Sur la VM Linux, exécutez la commande suivante pour indiquer à l'Universal Forwarder où envoyer les logs (vers votre VM Windows qui exécute Splunk) :

```bash
sudo /opt/splunkforwarder/bin/splunk add forward-server <IP_VMWINDOWS>:9997
```

- **<IP_VMWINDOWS>** est l'adresse IP de la VM Windows qui héberge Splunk.
- **9997** est le port par défaut pour la réception des données Splunk (le port peut être configuré différemment sur la VM Windows).

#### b. Configurer les inputs pour envoyer les logs

Ensuite, configurez quels fichiers de logs ou événements vous voulez surveiller et envoyer. Par exemple, pour envoyer les logs du système Linux :

```bash
sudo /opt/splunkforwarder/bin/splunk add monitor /var/log/syslog
sudo /opt/splunkforwarder/bin/splunk add monitor /var/log/auth.log
```

Vous pouvez ajouter d'autres fichiers de logs ou répertoires à surveiller selon vos besoins. Le fichier de configuration associé est situé dans `/opt/splunkforwarder/etc/system/local/inputs.conf`.

Exemple de configuration dans **inputs.conf** :
```conf
[monitor:///var/log/syslog]
disabled = false
index = linux_logs
sourcetype = syslog

[monitor:///var/log/auth.log]
disabled = false
index = linux_logs
sourcetype = authlog
```

### 3. **Configurer Splunk sur la VM Windows pour recevoir les logs**

Vous devez maintenant configurer Splunk sur votre VM Windows pour qu'il accepte les données envoyées par le forwarder Splunk installé sur la VM Linux.

#### a. Ouvrir le port de réception sur Splunk (VM Windows)

1. Connectez-vous à Splunk sur la VM Windows via le navigateur web (généralement `http://localhost:8000`).
2. Accédez à **Settings** > **Forwarding and Receiving** > **Configure Receiving**.
3. Cliquez sur **Add New** et entrez le port **9997** (ou un autre si vous avez choisi un port différent lors de la configuration de l'Universal Forwarder).

Cela configure Splunk pour écouter sur ce port et recevoir les logs de l'Universal Forwarder.

#### b. Créer un index pour les logs Linux

Dans Splunk, vous pouvez créer un index pour stocker les logs venant de la VM Linux.

1. Allez dans **Settings** > **Indexes** > **New Index**.
2. Donnez un nom à l'index (par exemple, `linux_logs`).
3. Configurez les autres paramètres si nécessaire, puis cliquez sur **Save**.

#### c. Vérifier la réception des logs

Une fois que l'Universal Forwarder envoie des logs à la VM Windows, vous pouvez vérifier leur réception dans l'interface Splunk :

1. Accédez à la **Recherche et création de rapports** (Search & Reporting).
2. Utilisez une recherche simple pour vérifier les logs :

   ```spl
   index=linux_logs
   ```

Cela affichera tous les logs envoyés par la VM Linux.

### 4. **Ouvrir les ports dans les pare-feux**

Assurez-vous que les ports utilisés pour la communication entre la VM Linux et la VM Windows (par exemple, le port 9997) sont ouverts sur le pare-feu des deux machines.

Sur la VM **Linux**, si un pare-feu est activé, vous pouvez ouvrir le port avec `ufw` (si vous utilisez Ubuntu) :

```bash
sudo ufw allow 9997/tcp
```

Sur la VM **Windows**, ouvrez également le port dans le pare-feu Windows via la configuration du **pare-feu Windows**.

### 5. **Vérifications supplémentaires**

- **Dépannage** : Si vous ne voyez pas les logs dans Splunk, vérifiez les logs du forwarder sur la VM Linux, qui sont situés dans `/opt/splunkforwarder/var/log/splunk/splunkd.log`.
- **Redémarrer les services** : Si nécessaire, redémarrez le Splunk Universal Forwarder et le service Splunk sur Windows pour vous assurer que toutes les configurations sont prises en compte.

```bash
sudo /opt/splunkforwarder/bin/splunk restart
```

### Conclusion

En suivant ces étapes, vous configurez une VM Linux pour envoyer ses logs à une VM Windows qui exécute Splunk. Le **Universal Forwarder** est configuré pour surveiller et envoyer les logs vers le serveur Splunk, tandis que le serveur Splunk sur la VM Windows est configuré pour recevoir ces données et les indexer pour l'analyse.