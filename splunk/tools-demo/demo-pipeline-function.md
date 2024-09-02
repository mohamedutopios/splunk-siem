Les fonctions arithmétiques comme `sum`, `avg`, `min`, `max`, `count`, et `stddev` sont couramment utilisées dans Splunk pour effectuer des agrégations de données. Voici des exemples d'utilisation de ces fonctions appliquées aux types de données que vous avez fournis.

### 1. **`sum` (Somme)**
   - **Objectif** : Calculer la somme totale des octets (`bytes`) transférés pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats sum(bytes) as total_bytes by uri | table uri total_bytes
     ```
   - **Explication** : La fonction `sum` additionne les valeurs du champ `bytes` pour chaque URI.

### 2. **`avg` (Moyenne)**
   - **Objectif** : Calculer le temps de réponse moyen (`req_time`) pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats avg(req_time) as avg_response_time by uri | table uri avg_response_time
     ```
   - **Explication** : La fonction `avg` calcule la moyenne des valeurs du champ `req_time` pour chaque URI.

### 3. **`min` (Minimum)**
   - **Objectif** : Trouver le plus petit nombre d'octets (`bytes`) transférés pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats min(bytes) as min_bytes by uri | table uri min_bytes
     ```
   - **Explication** : La fonction `min` retourne la plus petite valeur du champ `bytes` pour chaque URI.

### 4. **`max` (Maximum)**
   - **Objectif** : Trouver le plus grand nombre d'octets (`bytes`) transférés pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats max(bytes) as max_bytes by uri | table uri max_bytes
     ```
   - **Explication** : La fonction `max` retourne la plus grande valeur du champ `bytes` pour chaque URI.

### 5. **`count` (Comptage)**
   - **Objectif** : Compter le nombre d'événements pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats count by uri | table uri count
     ```
   - **Explication** : La fonction `count` retourne le nombre d'événements pour chaque URI.

### 6. **`stddev` (Écart type)**
   - **Objectif** : Calculer l'écart type des octets (`bytes`) transférés pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats stddev(bytes) as stddev_bytes by uri | table uri stddev_bytes
     ```
   - **Explication** : La fonction `stddev` calcule l'écart type des valeurs du champ `bytes` pour chaque URI, ce qui mesure la dispersion des données.

### 7. **`values` (Liste des valeurs uniques)**
   - **Objectif** : Lister toutes les valeurs uniques du champ `status` pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats values(status) as status_codes by uri | table uri status_codes
     ```
   - **Explication** : La fonction `values` retourne une liste des valeurs uniques du champ `status` pour chaque URI.

### 8. **`distinct_count` (Comptage des valeurs uniques)**
   - **Objectif** : Compter le nombre de valeurs uniques du champ `clientip` pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats distinct_count(clientip) as unique_ips by uri | table uri unique_ips clientip="87.194.216.51"
     ```
   - **Explication** : La fonction `distinct_count` retourne le nombre de valeurs uniques du champ `clientip` pour chaque URI.

### 9. **`median` (Médiane)**
   - **Objectif** : Calculer la médiane des octets (`bytes`) transférés pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats median(bytes) as median_bytes by uri | table uri median_bytes
     ```
   - **Explication** : La fonction `median` calcule la valeur médiane des octets transférés pour chaque URI.

### 10. **`range` (Étendue)**
   - **Objectif** : Calculer l'étendue (différence entre la valeur maximale et minimale) des octets (`bytes`) transférés pour chaque URI.
   - **Recherche** :
     ```spl
     index=web | stats range(bytes) as bytes_range by uri | table uri bytes_range
     ```
   - **Explication** : La fonction `range` retourne la différence entre les valeurs maximales et minimales du champ `bytes` pour chaque URI.

Ces fonctions arithmétiques et statistiques sont essentielles pour l'analyse des logs dans Splunk. Elles permettent de résumer les données, de détecter des tendances, et d'identifier des anomalies en fonction de vos besoins analytiques.