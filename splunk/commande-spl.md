Le **Search Processing Language (SPL)** de Splunk est un langage très flexible qui offre une multitude d'options pour manipuler, rechercher et analyser les données. Voici un aperçu des principales commandes et options SPL avec des exemples pratiques pour illustrer leur utilisation.

### 1. **Commandes de recherche de base**

- **`search`** : Recherche de base pour filtrer les événements.
  ```spl
  search index=web_logs error
  ```
  *Filtre les événements dans l'index `web_logs` contenant le mot "error".*

- **`index`** : Spécifie l'index à rechercher.
  ```spl
  index=security_logs
  ```
  *Recherche tous les événements dans l'index `security_logs`.*

- **`sourcetype`** : Filtre les événements par type de source.
  ```spl
  index=web_logs sourcetype=access_combined
  ```
  *Recherche les événements du type de source `access_combined` dans l'index `web_logs`.*

### 2. **Commandes de transformation**

- **`stats`** : Effectue des calculs statistiques sur les événements.
  ```spl
  index=web_logs | stats count by status
  ```
  *Compte le nombre d'événements par code de statut HTTP.*

- **`eval`** : Crée de nouveaux champs calculés.
  ```spl
  index=web_logs | eval load_time=duration/1000
  ```
  *Calcule un nouveau champ `load_time` en divisant `duration` par 1000.*

- **`timechart`** : Crée des graphiques de séries temporelles.
  ```spl
  index=web_logs | timechart avg(response_time) by host
  ```
  *Affiche le temps de réponse moyen par hôte sous forme de graphique de séries temporelles.*

- **`table`** : Affiche les résultats sous forme de table.
  ```spl
  index=web_logs | table _time host status
  ```
  *Affiche les champs `time`, `host`, et `status` dans une table.*

- **`rename`** : Renomme les champs pour les résultats.
  ```spl
  index=web_logs | rename _time as Time, host as Hostname
  ```
  *Renomme `_time` en `Time` et `host` en `Hostname`.*

### 3. **Commandes de filtrage et de tri**

- **`where`** : Applique des conditions de filtrage.
  ```spl
  index=web_logs | where response_time > 500
  ```
  *Filtre les événements où `response_time` est supérieur à 500 millisecondes.*

- **`dedup`** : Supprime les doublons basés sur un ou plusieurs champs.
  ```spl
  index=web_logs | dedup host
  ```
  *Supprime les événements en double basés sur le champ `host`.*

- **`sort`** : Trie les résultats par un ou plusieurs champs.
  ```spl
  index=web_logs | sort -response_time
  ```
  *Trie les événements par `response_time` de manière décroissante.*

### 4. **Commandes de jointure et d'agrégation**

- **`join`** : Combine les résultats de deux recherches.
  ```spl
  index=web_logs | join type=inner user [ search index=user_data ]
  ```
  *Effectue une jointure interne sur le champ `user` entre les événements `web_logs` et `user_data`.*

- **`append`** : Ajoute les résultats d'une recherche à ceux d'une autre.
  ```spl
  search index=web_logs | append [ search index=error_logs ]
  ```
  *Combine les résultats de `web_logs` et `error_logs`.*

- **`transaction`** : Regroupe les événements corrélés en une seule transaction.
  ```spl
  index=web_logs | transaction session_id
  ```
  *Groupe les événements ayant le même `session_id` en une transaction.*

### 5. **Commandes de manipulation de chaînes et de champs**

- **`rex`** : Utilise des expressions régulières pour extraire des informations.
  ```spl
  index=web_logs | rex field=_raw "User: (?<username>\w+)"
  ```
  *Extrait le nom d'utilisateur du champ `_raw` en utilisant une expression régulière.*

- **`replace`** : Remplace les valeurs dans un champ.
  ```spl
  index=web_logs | replace "404" with "Not Found" in status
  ```
  *Remplace `404` par "Not Found" dans le champ `status`.*

### 6. **Commandes avancées**

- **`eval` avec des fonctions complexes** : Utilise des fonctions avancées comme `if`, `case`, ou `match`.
  ```spl
  index=web_logs | eval high_latency=if(response_time>1000, "Yes", "No")
  ```
  *Crée un nouveau champ `high_latency` indiquant "Yes" si `response_time` est supérieur à 1000 millisecondes.*

- **`bucket`** : Regroupe les résultats dans des intervalles de temps.
  ```spl
  index=web_logs | bucket _time span=1h | stats count by _time
  ```
  *Regroupe les événements par tranches horaires et compte le nombre d'événements par heure.*

- **`lookup`** : Utilise un fichier de correspondance pour enrichir les données.
  ```spl
  index=web_logs | lookup user_roles user_id OUTPUT role
  ```
  *Enrichit les événements avec le rôle de l'utilisateur basé sur un fichier de correspondance `user_roles`.*

### 7. **Commandes de visualisation**

- **`chart`** : Crée des graphiques à partir des résultats.
  ```spl
  index=web_logs | chart count by status
  ```
  *Crée un graphique montrant le nombre d'événements par code de statut.*

- **`geostats`** : Crée des visualisations géographiques.
  ```spl
  index=web_logs | geostats latfield=lat longfield=lon count
  ```
  *Crée une carte géographique basée sur les champs de latitude et de longitude.*

### 8. **Autres commandes utiles**

- **`eventstats`** : Calcule des statistiques au niveau de l'événement.
  ```spl
  index=web_logs | eventstats avg(response_time) as avg_response_time
  ```
  *Calcule la moyenne du temps de réponse sur l'ensemble des événements et ajoute un nouveau champ `avg_response_time` à chaque événement.*

- **`multisearch`** : Combine les résultats de plusieurs recherches.
  ```spl
  | multisearch [ search index=web_logs status=500 ] [ search index=web_logs status=404 ]
  ```
  *Combine les résultats des recherches pour les statuts `500` et `404`.*

### Conclusion

Le SPL est extrêmement puissant et flexible, offrant de nombreuses commandes pour extraire et analyser des données de manière très précise. Les exemples ci-dessus montrent seulement un aperçu des possibilités qu'il offre pour manipuler les données dans Splunk. En combinant ces commandes, il est possible de créer des requêtes très complexes pour répondre à des besoins d'analyse de données spécifiques.