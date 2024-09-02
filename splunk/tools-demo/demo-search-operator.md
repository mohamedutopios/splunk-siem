Voici quelques exemples de recherches Splunk variées utilisant les opérateurs logiques OR, NOT, AND, etc., basés sur le format de données que vous avez fourni.

### 1. **Rechercher tous les événements avec un échec de connexion (Failed password)**
   ```spl
   "Failed password"
   ```
   Cette recherche retournera tous les événements contenant "Failed password".

### 2. **Rechercher tous les événements avec une session ouverte pour un utilisateur spécifique (djohnson)**
   ```spl
   "session opened for user djohnson"
   ```
   Cette recherche retournera les événements où une session a été ouverte pour l'utilisateur "djohnson".

### 3. **Rechercher tous les événements où l'utilisateur est "nobody" ou "apache"**
   ```spl
   ("Failed password for nobody" OR "Failed password for apache")
   ```
   Cette recherche retournera les événements où les utilisateurs "nobody" ou "apache" ont échoué à se connecter.

### 4. **Exclure les événements où l'utilisateur est "root"**
   ```spl
   "session opened" NOT "user root"
   ```
   Cette recherche retournera tous les événements où une session a été ouverte, mais exclura ceux où l'utilisateur est "root".

### 5. **Rechercher les échecs de connexion pour des utilisateurs spécifiques (db2 et irc)**
   ```spl
   ("Failed password for invalid user db2" AND "Failed password for invalid user irc")
   ```
   Cette recherche retourne les événements où les utilisateurs "db2" et "irc" ont échoué à se connecter. Cependant, pour les trouver ensemble dans le même événement, vous devriez plutôt chercher chaque utilisateur séparément ou reformuler la recherche.

### 6. **Rechercher les événements avec des échecs de connexion mais pas pour l'utilisateur "jabber"**
   ```spl
   "Failed password" NOT "user jabber"
   ```
   Cette recherche retournera tous les échecs de connexion, sauf ceux pour l'utilisateur "jabber".

### 7. **Rechercher des connexions acceptées provenant d'une adresse IP spécifique**
   ```spl
   "Accepted password" AND "from 10.1.10.172"
   ```
   Cette recherche retournera les événements où une connexion a été acceptée pour l'adresse IP "10.1.10.172".

### 8. **Rechercher tous les événements sauf ceux concernant les utilisateurs "guest" et "local"**
   ```spl
   NOT ("user guest" OR "user local")
   ```
   Cette recherche exclura tous les événements liés aux utilisateurs "guest" et "local".

### 9. **Rechercher tous les événements liés à l'adresse IP "118.142.68.222" sauf pour l'utilisateur "nobody"**
   ```spl
   "from 118.142.68.222" NOT "user nobody"
   ```
   Cette recherche retournera tous les événements provenant de l'adresse IP "118.142.68.222", sauf ceux où l'utilisateur est "nobody".

### 10. **Rechercher les événements où une session a été ouverte ou une connexion a échoué, mais pas pour l'utilisateur "djohnson"**
   ```spl
   ("session opened" OR "Failed password") NOT "user djohnson"
   ```
   Cette recherche retournera les événements où une session a été ouverte ou une connexion a échoué, mais exclura ceux pour l'utilisateur "djohnson".

Ces exemples montrent comment utiliser les opérateurs logiques pour affiner vos recherches dans Splunk. En combinant OR, AND, et NOT, vous pouvez rechercher des événements spécifiques, exclure des résultats non pertinents, et obtenir des informations précises à partir de vos données.