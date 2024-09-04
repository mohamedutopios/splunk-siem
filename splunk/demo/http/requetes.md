Pour identifier ces anomalies et incidents via Splunk, voici quelques requêtes de recherche SPL (Search Processing Language) spécifiques aux types d'événements que vous souhaitez détecter. Ces requêtes sont conçues pour extraire et signaler les comportements suspects dans les logs HTTP.

### 1. **Tentatives de Brute Force (Multiples échecs de connexion)**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> "POST /wp-login.php" status=401
| stats count by clientip
| where count > 5
```
- Cette requête recherche les tentatives répétées de connexion échouées sur la page `/wp-login.php` avec des réponses 401. Elle affiche les adresses IP avec plus de 5 échecs de connexion.

### 2. **Accès à des Pages Sensibles (ex. /admin ou /config)**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> (uri_path="/admin" OR uri_path="/config")
| stats count by clientip uri_path
| where count > 0
```
- Cette requête cherche toutes les tentatives d'accès aux pages sensibles `/admin` ou `/config`, en les regroupant par adresse IP et chemin URI.

### 3. **Requêtes vers des Fichiers Sensibles (ex. /wp-config.php, /phpmyadmin)**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> (uri_path="/wp-config.php" OR uri_path="/phpmyadmin" OR uri_path="/pma" OR uri_path="/mysql")
| stats count by clientip uri_path
| where count > 0
```
- Cette recherche identifie les requêtes faites vers des fichiers sensibles qui pourraient indiquer une tentative d'accès ou de reconnaissance.

### 4. **Erreurs Serveur 500 Répétées**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> status=500
| stats count by clientip uri_path
| where count > 5
```
- Cette requête recherche les erreurs serveur 500 répétées et les groupe par IP et chemin d'URI. Si un utilisateur voit plusieurs erreurs 500 sur une période donnée, cela peut indiquer un problème ou une tentative d'exploitation.

### 5. **Accès Interdit (403) à des Pages Sensibles**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> status=403
| stats count by clientip uri_path
| where count > 0
```
- Cette requête trouve les requêtes qui ont généré une réponse 403 (accès interdit), souvent liées à des tentatives d'intrusion sur des pages sensibles comme `/admin` ou `/private`.

### 6. **Détection d'Exploit via XML-RPC (Utilisation anormale de /xmlrpc.php)**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> uri_path="/xmlrpc.php"
| stats count by clientip status
| where count > 5 AND status=500
```
- Cette requête détecte les requêtes vers `/xmlrpc.php` qui retournent une erreur 500, souvent un signe d'exploit ou d'attaque DDoS via ce fichier.

### 7. **Tentatives de Suppression de Données (Requêtes DELETE)**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> method=DELETE
| stats count by clientip uri_path
| where count > 0
```
- Cette requête recherche toutes les requêtes DELETE, qui sont généralement critiques et sensibles. Si elles apparaissent sans autorisation adéquate, cela peut indiquer une tentative malveillante.

### 8. **Pic d'Erreurs (403 et 500) sur une Période de Temps**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> (status=403 OR status=500)
| timechart span=5m count by status
```
- Cette recherche produit un graphique temporel montrant l'évolution des erreurs 403 et 500 sur des intervalles de 5 minutes. Cela aide à identifier des pics inhabituels d'erreurs qui peuvent indiquer des incidents.

### 9. **Top des IPs Effectuant des Requêtes Suspectes**

```splunk
index=<votre_index> sourcetype=<votre_sourcetype> (uri_path="/admin" OR uri_path="/wp-config.php" OR uri_path="/xmlrpc.php" OR uri_path="/private")
| stats count by clientip
| sort - count
```
- Cette requête classe les adresses IP en fonction du nombre de requêtes vers des chemins d'accès sensibles ou suspects. Elle aide à identifier rapidement les IPs effectuant des actions suspectes.

---

Ces requêtes peuvent être affinées en fonction de la structure exacte de vos logs (noms de champs, index, sourcetype). Les résultats peuvent ensuite être visualisés sous forme de tableaux ou de graphiques dans Splunk pour faciliter l'analyse des incidents.