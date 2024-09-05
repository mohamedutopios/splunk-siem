Pour établir une connexion SSH entre la VM Linux (où vous souhaitez exécuter le script) et la machine Windows où Splunk est installé, vous devez configurer l'authentification par clé SSH, ce qui permettra à la machine Windows d'exécuter des commandes sur la VM Linux sans avoir besoin de saisir un mot de passe à chaque fois. Voici les étapes détaillées pour configurer cette connexion SSH :

### 1. **Générer une paire de clés SSH sur la machine Windows**

Si vous utilisez OpenSSH sur Windows ou PuTTY (via `PuTTYgen`), vous devrez d'abord générer une paire de clés SSH (publique et privée) pour l'authentification entre les deux machines.

#### Méthode 1 : Avec OpenSSH sur Windows (Windows 10 ou supérieur)

Si OpenSSH est installé sur votre machine Windows, vous pouvez utiliser la commande `ssh-keygen` pour générer une paire de clés.

1. **Ouvrez PowerShell** ou une invite de commandes.
2. Tapez la commande suivante pour générer une paire de clés SSH :

   ```bash
   ssh-keygen -t rsa -b 4096
   ```

   - Cela générera une clé RSA avec une longueur de 4096 bits.
   - Par défaut, les clés seront stockées dans le répertoire `C:\Users\<votre_nom_utilisateur>\.ssh\` sous les noms `id_rsa` (clé privée) et `id_rsa.pub` (clé publique).
   - Vous pouvez appuyer sur Entrée pour utiliser les emplacements par défaut ou spécifier un chemin personnalisé.

3. **Ne mettez pas de phrase secrète** (facultatif) :
   Lorsque `ssh-keygen` vous demande une **passphrase**, vous pouvez laisser le champ vide si vous ne voulez pas être invité à entrer un mot de passe chaque fois que vous exécutez une commande.

#### Méthode 2 : Avec PuTTY et PuTTYgen

Si vous préférez utiliser **PuTTY** (plus courant sur Windows), voici comment générer une paire de clés avec **PuTTYgen** :

1. **Téléchargez et installez PuTTY** depuis [le site officiel](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html), si ce n'est pas déjà fait.
2. Ouvrez **PuTTYgen** (inclus avec PuTTY).
3. Dans PuTTYgen :
   - Sélectionnez **RSA** comme type de clé.
   - Choisissez une longueur de clé de **4096 bits**.
   - Cliquez sur **Generate**, puis suivez les instructions pour bouger la souris afin de générer de l'entropie.
4. Une fois la clé générée :
   - Cliquez sur **Save private key** pour enregistrer la clé privée sur votre machine (par exemple, sous `C:\Users\<votre_nom_utilisateur>\.ssh\private_key.ppk`).
   - Cliquez sur **Save public key** pour enregistrer la clé publique.
   - Copiez également le contenu de la clé publique affichée dans la fenêtre.

### 2. **Copier la clé publique vers la VM Linux**

Maintenant que vous avez généré la clé publique, vous devez la copier sur la VM Linux pour permettre l'authentification sans mot de passe.

#### Méthode 1 : Utiliser OpenSSH (Windows)

1. Connectez-vous à la VM Linux avec un mot de passe une première fois en utilisant **OpenSSH** (si disponible sur Windows) :

   ```bash
   ssh username@VM_IP
   ```

2. Une fois connecté, copiez la clé publique générée précédemment (fichier `id_rsa.pub` ou la sortie générée par PuTTYgen) dans le fichier **authorized_keys** de l'utilisateur sur la VM.

   - Ouvrez un terminal sur la VM et exécutez :

     ```bash
     mkdir -p ~/.ssh
     chmod 700 ~/.ssh
     ```

   - Ajoutez la clé publique à `~/.ssh/authorized_keys` :

     ```bash
     echo "votre_clé_publique_ici" >> ~/.ssh/authorized_keys
     chmod 600 ~/.ssh/authorized_keys
     ```

   - Remplacez `"votre_clé_publique_ici"` par la clé publique que vous avez générée sur la machine Windows.

3. Déconnectez-vous de la VM et essayez à nouveau de vous connecter via SSH depuis Windows, cette fois-ci sans mot de passe :

   ```bash
   ssh -i C:\Users\<votre_nom_utilisateur>\.ssh\id_rsa username@VM_IP
   ```

#### Méthode 2 : Utiliser PuTTY et **pscp** ou **PuTTYgen**

Si vous utilisez PuTTY et que vous avez généré des clés avec PuTTYgen, voici comment copier la clé publique sur la VM :

1. Ouvrez **PuTTY** et connectez-vous à la VM en utilisant le nom d'utilisateur et le mot de passe.
2. Une fois connecté à la VM, créez le fichier `~/.ssh/authorized_keys` si ce n'est pas déjà fait :

   ```bash
   mkdir -p ~/.ssh
   chmod 700 ~/.ssh
   ```

3. Utilisez l'outil **pscp** pour copier le fichier contenant votre clé publique vers la VM Linux :

   ```bash
   pscp C:\path\to\public_key_file.pub username@VM_IP:/home/username/.ssh/authorized_keys
   ```

4. Sur la VM, assurez-vous que les permissions sont correctes :

   ```bash
   chmod 600 ~/.ssh/authorized_keys
   ```

5. Maintenant, vous pouvez vous connecter via PuTTY ou Plink sans mot de passe, en spécifiant la clé privée (fichier `.ppk`).

   - Dans **PuTTY**, sous **Connection > SSH > Auth**, sélectionnez le fichier `.ppk` dans le champ **Private key file for authentication**.
   - Ou utilisez **Plink** pour exécuter une commande :

     ```bash
     plink -i C:\path\to\private_key.ppk username@VM_IP "echo 'Test depuis Windows' >> /home/username/test_message.txt"
     ```

### 3. **Configurer Splunk pour exécuter le script SSH**

Une fois la connexion SSH sans mot de passe configurée entre la machine Windows (où Splunk est installé) et la VM Linux, vous pouvez configurer l'alerte dans Splunk pour exécuter un script.

1. Placez le script batch ou PowerShell sur la machine Windows avec la commande SSH ou Plink pour exécuter des actions sur la VM distante.

2. Dans Splunk :
   - Allez dans l'alerte que vous avez configurée.
   - Sous **Trigger Actions**, sélectionnez **Run a Script**.
   - Spécifiez le chemin complet du script que vous avez créé, par exemple :

     ```bash
     C:\path\to\your_script.bat
     ```

### 4. **Testez la connexion**

Assurez-vous que la connexion SSH fonctionne bien et que le script s'exécute correctement via Splunk.

1. Essayez d'exécuter le script manuellement pour voir s'il écrit correctement dans le fichier texte de la VM :

   ```bash
   C:\path\to\your_script.bat
   ```

2. Ensuite, déclenchez l'alerte dans Splunk pour voir si le script s'exécute automatiquement.

---

### Conclusion

Une fois que vous avez configuré l'authentification par clé SSH entre la machine Windows et la VM Linux, vous pourrez exécuter des actions à distance sur la VM via Splunk sans intervention humaine. Vous pouvez utiliser soit OpenSSH sur Windows (avec `ssh`), soit PuTTY/Plink pour établir et automatiser la connexion SSH.