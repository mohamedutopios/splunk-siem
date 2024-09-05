L'erreur `ssh: connect to host 192.168.1.113 port 22: Connection refused` indique que la connexion SSH à la VM est refusée. Voici les raisons potentielles de ce problème ainsi que les étapes pour résoudre ce problème :

### 1. **Vérifier si le service SSH est installé et en cours d'exécution sur la VM Linux**

Il est probable que le service SSH ne soit pas installé ou ne soit pas en cours d'exécution sur votre machine Linux. Voici comment vous pouvez vérifier cela et le corriger :

#### a. Vérifiez si SSH est installé sur la VM

Connectez-vous à la VM (si possible via un autre moyen, comme la console directe ou un accès à distance via un autre protocole) et exécutez la commande suivante pour vérifier si OpenSSH est installé :

```bash
sudo systemctl status ssh
```

- Si vous voyez une ligne indiquant `Active: active (running)`, cela signifie que le service SSH fonctionne.
- Si le service n'est pas installé ou ne fonctionne pas, continuez avec les étapes suivantes.

#### b. Installer le serveur SSH

Si SSH n'est pas installé, vous devez l'installer :

Sur une distribution **Ubuntu** ou **Debian**, utilisez la commande suivante :

```bash
sudo apt update
sudo apt install openssh-server
```

Sur une distribution **CentOS** ou **RHEL**, utilisez :

```bash
sudo yum install openssh-server
```

#### c. Démarrer et activer le service SSH

Une fois que le serveur SSH est installé, démarrez-le et configurez-le pour démarrer automatiquement au démarrage du système :

```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

Vérifiez à nouveau l'état avec :

```bash
sudo systemctl status ssh
```

### 2. **Vérifier si le port 22 est ouvert sur la VM**

Si le serveur SSH est en cours d'exécution, il est possible qu'un pare-feu bloque les connexions SSH sur le port 22. Vous devez vérifier les règles de pare-feu sur la VM.

#### a. Utiliser **ufw** (pare-feu Ubuntu)

Si vous utilisez un pare-feu `ufw` (le pare-feu par défaut sur Ubuntu), assurez-vous que le port 22 est ouvert :

```bash
sudo ufw allow ssh
```

Vérifiez l'état du pare-feu avec :

```bash
sudo ufw status
```

Cela devrait indiquer que SSH est autorisé à passer.

#### b. Vérifier avec **iptables** (pour d'autres distributions)

Si vous utilisez `iptables` pour la gestion du pare-feu, vérifiez les règles actuelles et assurez-vous que le port 22 est autorisé :

```bash
sudo iptables -L
```

Si nécessaire, autorisez le port 22 avec cette commande :

```bash
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

### 3. **Vérifier la configuration SSH sur la VM**

La configuration du serveur SSH se trouve dans le fichier `/etc/ssh/sshd_config`. Assurez-vous que le serveur SSH est configuré pour écouter sur le port 22.

1. Ouvrez le fichier de configuration SSH avec un éditeur de texte :

   ```bash
   sudo nano /etc/ssh/sshd_config
   ```

2. Recherchez la ligne suivante et assurez-vous qu'elle n'est pas commentée (c'est-à-dire qu'elle ne commence pas par un `#`) :

   ```bash
   Port 22
   ```

3. Assurez-vous également que SSH est configuré pour écouter sur toutes les interfaces réseau, avec cette ligne (ou une ligne similaire) :

   ```bash
   ListenAddress 0.0.0.0
   ```

4. Une fois les modifications apportées (si nécessaire), enregistrez le fichier et redémarrez le service SSH :

   ```bash
   sudo systemctl restart ssh
   ```

### 4. **Vérifier l'accessibilité de la VM via le réseau**

Si SSH est bien installé et configuré sur la VM, vous devez également vérifier que la VM est accessible sur le réseau et que le port 22 est bien ouvert.

#### a. Pinger la VM

Depuis votre machine Windows, essayez de pinger la VM pour voir si elle est accessible sur le réseau :

```bash
ping 192.168.1.113
```

Si le ping échoue, il peut y avoir un problème de connectivité réseau entre les deux machines.

#### b. Scanner les ports ouverts

Vous pouvez utiliser un outil comme `nmap` pour vérifier si le port 22 est ouvert sur la VM. Si vous n'avez pas `nmap` installé, vous pouvez utiliser un scanner de ports en ligne ou installer `nmap` sur votre machine Windows.

```bash
nmap 192.168.1.113 -p 22
```

Si le port 22 n'apparaît pas comme "open", cela indique que la connexion est bloquée, soit par un pare-feu, soit par une configuration réseau.

### 5. **Vérifier le pare-feu ou la sécurité au niveau de l'hôte**

Si vous utilisez une infrastructure dans le cloud (par exemple, AWS, Azure, ou GCP), vérifiez que les **groupes de sécurité** ou les **firewall rules** autorisent les connexions SSH (port 22) depuis l'adresse IP de la machine Windows.

### Conclusion

Le message "Connection refused" indique généralement que le service SSH n'est pas actif sur la VM ou que quelque chose bloque les connexions au port 22. En suivant ces étapes, vous devriez pouvoir diagnostiquer et résoudre le problème en vérifiant le service SSH, la configuration du pare-feu, la connectivité réseau, et les règles de sécurité.