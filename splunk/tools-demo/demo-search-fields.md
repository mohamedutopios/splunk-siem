Voici des exemples de recherches Splunk utilisant non seulement les opérateurs logiques (AND, OR, NOT) mais aussi des opérateurs de comparaison comme `<`, `>`, `<=`, `>=` sur différents champs.

### 1. **Rechercher les événements où le statut HTTP est `200` et le nombre d'octets transmis est supérieur à 1000**
   - **Recherche** :
     ```spl
     status=200 AND bytes > 1000
     ```
   - Cela retourne tous les événements où le code de statut HTTP est `200` et où le nombre d'octets transmis est supérieur à 1000.

### 2. **Rechercher les événements où le statut HTTP est supérieur ou égal à `500` (erreurs serveur)**
   - **Recherche** :
     ```spl
     status >= 500
     ```
   - Cela retourne tous les événements où le code de statut HTTP est `500` ou plus (par exemple, 500, 502, 503, etc.), indiquant une erreur serveur.

### 3. **Rechercher les événements où l'URI contient `productId` et où la méthode est `POST`, mais seulement si le nombre d'octets transmis est inférieur à 2000**
   - **Recherche** :
     ```spl
     uri_query="productId" AND method="POST" AND bytes < 2000
     ```
   - Cela retourne tous les événements où une requête `POST` a été faite pour une URI contenant `productId` et où le nombre d'octets transmis est inférieur à 2000.

### 4. **Rechercher les événements où le statut HTTP est `404` et le temps de traitement de la requête est supérieur à 500 millisecondes**
   - **Recherche** :
     ```spl
     status=404 AND response_time > 500
     ```
   - Cela retourne tous les événements où le code de statut HTTP est `404` et où le temps de traitement de la requête est supérieur à 500 ms.

### 5. **Rechercher les événements où le nombre d'octets transmis est compris entre 1000 et 3000 (inclus)**
   - **Recherche** :
     ```spl
     bytes >= 1000 AND bytes <= 3000
     ```
   - Cela retourne tous les événements où le nombre d'octets transmis est compris entre 1000 et 3000.

### 6. **Rechercher les événements où l'adresse IP est `117.21.246.164` et où le statut HTTP est inférieur à `400` (succès ou redirections)**
   - **Recherche** :
     ```spl
     clientip="117.21.246.164" AND status < 400
     ```
   - Cela retourne tous les événements où l'adresse IP est `117.21.246.164` et où le code de statut HTTP est inférieur à 400 (donc, réussites ou redirections).

### 7. **Rechercher les événements où l'URI contient `categoryId=STRATEGY` et où la méthode est `GET`, mais exclure ceux où le temps de traitement est inférieur ou égal à 100 ms**
   - **Recherche** :
     ```spl
     uri_query="categoryId=STRATEGY" AND method="GET" AND response_time > 100
     ```
   - Cela retourne tous les événements où une requête `GET` a été faite pour une URI contenant `categoryId=STRATEGY` et où le temps de traitement est supérieur à 100 ms.

### 8. **Rechercher les événements où le statut HTTP est entre `400` et `499` (erreurs client)**
   - **Recherche** :
     ```spl
     status >= 400 AND status < 500
     ```
   - Cela retourne tous les événements où le code de statut HTTP est compris entre 400 et 499, ce qui indique une erreur côté client (comme `404 Not Found`).

### 9. **Rechercher les événements où le statut HTTP est `503` et où le User-Agent contient `Safari`, mais uniquement si le nombre d'octets transmis est supérieur à 3000**
   - **Recherche** :
     ```spl
     status=503 AND useragent="*Safari*" AND bytes > 3000
     ```
   - Cela retourne tous les événements où le code de statut HTTP est `503`, le User-Agent contient `Safari`, et où le nombre d'octets transmis est supérieur à 3000.

### 10. **Rechercher les événements où la méthode est `POST`, l'URI contient `productId=DC-SG-G02`, et le temps de traitement est inférieur ou égal à 200 ms**
    - **Recherche** :
      ```spl
      method="POST" AND uri_query="productId=DC-SG-G02" AND response_time <= 200
      ```
    - Cela retourne tous les événements où une requête `POST` a été faite pour `productId=DC-SG-G02` et où le temps de traitement est inférieur ou égal à 200 ms.

Ces recherches combinent des opérateurs logiques avec des comparaisons numériques pour affiner les résultats et extraire des informations très spécifiques à partir de vos logs dans Splunk. Ces techniques sont essentielles pour effectuer une analyse granulaire des données et répondre à des questions complexes concernant les performances, les erreurs, et les comportements des utilisateurs.