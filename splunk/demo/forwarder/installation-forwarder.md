
Pour configurer une VM Linux pour qu'elle envoie des logs à une VM Windows qui contient Splunk pour les analyser, vous devez suivre quelques étapes principales. Cela inclut l'installation et la configuration du Splunk Universal Forwarder sur la machine Linux pour qu'elle envoie ses logs à la VM Windows où Splunk est installé. Voici un guide étape par étape :

Étape 1 : Préparer la VM Windows avec Splunk
Assurez-vous que Splunk est correctement installé et configuré sur la VM Windows.

Installer Splunk Enterprise : Si ce n'est pas encore fait, téléchargez et installez Splunk sur la VM Windows.
Vous pouvez le télécharger depuis le site officiel de Splunk.
Suivez les instructions d'installation pour Windows.
Configurer Splunk pour recevoir les logs :
Connectez-vous à l'interface de Splunk via un navigateur (http://<adresse_IP_VM_Windows>:8000).
Allez dans Settings > Forwarding and receiving > Configure receiving.
Cliquez sur New Receiving Port et ajoutez un port pour recevoir les logs, par exemple le port 9997 (port par défaut pour les Universal Forwarders).
Étape 2 : Installer Splunk Universal Forwarder sur la VM Linux
Le Splunk Universal Forwarder est un agent léger utilisé pour transférer les logs d'une machine vers une instance Splunk. Vous allez l'installer sur la VM Linux pour qu'il envoie des logs à la VM Windows.

a. Télécharger et installer Splunk Universal Forwarder :
Connectez-vous à la VM Linux via SSH.

Téléchargez la version de Splunk Universal Forwarder pour Linux depuis le site officiel :

bash
Copier le code
wget -O splunkforwarder-8.2.0-a7f645ddaf91-Linux-x86_64.tgz "https://www.splunk.com/page/download_track?file=8.2.0/splunkforwarder-8.2.0-a7f645ddaf91-Linux-x86_64.tgz&platform=linux&architecture=x86_64&version=8.2.0&product=universalforwarder"
(Remplacez l'URL par la dernière version de Splunk Universal Forwarder disponible).

Extrayez le fichier :

bash
Copier le code
tar -xvzf splunkforwarder-8.2.0-a7f645ddaf91-Linux-x86_64.tgz
Déplacez-vous dans le répertoire splunkforwarder et installez-le :

bash
Copier le code
cd splunkforwarder
./bin/splunk start --accept-license
b. Configurer Splunk Universal Forwarder :
Ajoutez l'hôte Splunk (VM Windows) comme destination : Vous devez configurer le forwarder pour envoyer les logs à la VM Windows sur laquelle Splunk est installé.

Utilisez la commande suivante pour ajouter votre Splunk Windows comme serveur de réception (en utilisant l'adresse IP de la VM Windows et le port configuré, par exemple 9997) :

bash
Copier le code
./bin/splunk add forward-server <IP_VM_Windows>:9997 -auth admin:changeme
Remplacez <IP_VM_Windows> par l'adresse IP de votre VM Windows et 9997 par le port que vous avez configuré.

Configurer les sources des logs : Vous devez spécifier quels fichiers de logs ou répertoires seront envoyés au serveur Splunk. Pour ajouter des logs, vous pouvez utiliser la commande suivante :

bash
Copier le code
./bin/splunk add monitor /var/log/syslog
./bin/splunk add monitor /var/log/auth.log
Vous pouvez ajouter d'autres répertoires ou fichiers spécifiques si nécessaire. Par exemple, pour surveiller tout le répertoire /var/log/, utilisez :

bash
Copier le code
./bin/splunk add monitor /var/log/
Redémarrer le Splunk Universal Forwarder : Après avoir ajouté les sources de logs et le serveur Splunk de destination, redémarrez le forwarder pour que les changements prennent effet :

bash
Copier le code
./bin/splunk restart
Étape 3 : Configurer les Firewalls et Réseaux
Sur la VM Windows (qui contient Splunk) :

Assurez-vous que le port 9997 (ou tout autre port que vous avez configuré pour recevoir les logs) est ouvert dans le firewall Windows. Vous pouvez le faire via les paramètres du firewall Windows ou en utilisant la commande netsh.
Exemple pour ouvrir le port 9997 :

bash
Copier le code
netsh advfirewall firewall add rule name="Splunk 9997" dir=in action=allow protocol=TCP localport=9997
Sur la VM Linux :

Si vous avez un firewall (comme ufw ou iptables), assurez-vous que la machine peut envoyer des paquets TCP sur le port 9997 de la VM Windows.
Étape 4 : Vérifier la réception des logs dans Splunk
Allez sur votre interface Splunk (sur la VM Windows) via le navigateur : http://<adresse_IP_VM_Windows>:8000.
Dans Settings > Forwarding and receiving > Forwarded Data, vérifiez si les logs de la VM Linux arrivent bien.
Dans la barre de recherche de Splunk, vous pouvez rechercher les logs envoyés par la VM Linux en utilisant une recherche comme :
spl
Copier le code
index=_internal host=<nom_vm_linux>
Ou si vous avez configuré les logs du système (/var/log/syslog par exemple), vous pouvez exécuter une recherche pour voir les événements :
spl
Copier le code
index=main source="/var/log/syslog"
Conclusion
Splunk sur la VM Windows doit être configuré pour recevoir des logs (port de réception ouvert).
Splunk Universal Forwarder sur la VM Linux doit être configuré pour envoyer les logs au serveur Splunk Windows, et vous devez avoir configuré les fichiers de logs spécifiques à surveiller.
Vérifiez les paramètres réseau et firewall pour vous assurer que les deux VMs peuvent communiquer sur le port de réception des logs.
En suivant ces étapes, vous devriez pouvoir analyser les logs de votre VM Linux à partir de la VM Windows qui contient Splunk.