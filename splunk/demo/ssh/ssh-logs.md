## Combler les champs manquants avec des entêtes et récupérer le resultat sous forme de table : 

source="ssh.log" host="test" index="main" sourcetype="test"
| rex field=_raw "^(?<timestamp>\d+\.\d+)\s+(?<session_id>\w+)\s+(?<src_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+(?<src_port>\d+)\s+(?<dest_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+(?<dest_port>\d+)\s+(?<status>\w+)\s+(?<direction>\w+)\s+(?<ssh_version_client>[^\s]+)\s+(?<ssh_version_server>[^\s]+)"
| table timestamp session_id src_ip src_port dest_ip dest_port status direction ssh_version_client ssh_version_server


## Explications : 

Pour extraire les champs pertinents de ces logs dans Splunk, vous pouvez utiliser la commande `rex` pour capturer les informations structurées. Les logs semblent déjà bien structurés, avec chaque champ séparé par un espace ou une tabulation. 

Voici comment vous pourriez procéder pour extraire les différents champs (timestamp, session ID, IP source, port source, IP destination, port destination, statut, direction, version SSH client, version SSH server) :

### Étape 1 : Identifier les champs

Les logs suivent ce modèle :

```
timestamp    session_id    src_ip    src_port    dest_ip    dest_port    status    direction    ssh_version_client    ssh_version_server    ... (autres champs)
```

### Étape 2 : Utiliser `rex` pour extraire les champs

Voici une commande Splunk pour extraire ces champs :

```spl
index=your_index sourcetype=your_sourcetype
| rex field=_raw "^(?<timestamp>\d+\.\d+)\s+(?<session_id>\w+)\s+(?<src_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+(?<src_port>\d+)\s+(?<dest_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+(?<dest_port>\d+)\s+(?<status>\w+)\s+(?<direction>\w+)\s+(?<ssh_version_client>[^\s]+)\s+(?<ssh_version_server>[^\s]+)"
| table timestamp session_id src_ip src_port dest_ip dest_port status direction ssh_version_client ssh_version_server
```

### Explication du modèle regex :

- `(?<timestamp>\d+\.\d+)` : Cette partie capture le timestamp au format numérique avec des décimales.
- `(?<session_id>\w+)` : Capture l'ID de session qui est composé de caractères alphanumériques.
- `(?<src_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})` : Capture l'adresse IP source.
- `(?<src_port>\d+)` : Capture le port source.
- `(?<dest_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})` : Capture l'adresse IP destination.
- `(?<dest_port>\d+)` : Capture le port destination.
- `(?<status>\w+)` : Capture le statut de la connexion (`failure` dans ce cas).
- `(?<direction>\w+)` : Capture la direction du flux (`INBOUND` ou `OUTBOUND`).
- `(?<ssh_version_client>[^\s]+)` : Capture la version du client SSH.
- `(?<ssh_version_server>[^\s]+)` : Capture la version du serveur SSH.

### Étape 3 : Visualiser les champs extraits

La commande `table` est utilisée pour afficher les champs extraits de manière organisée.

### Conclusion

Avec cette configuration, vous pouvez facilement analyser les logs SSH pour identifier les tentatives de connexion, les versions de SSH utilisées, et bien plus encore. Vous pouvez ajuster le regex si les logs ont des variations ou si des champs supplémentaires sont nécessaires.