**Splunk Search & Reporting**, aussi connu sous le nom de Splunk Enterprise, est un outil puissant pour la recherche, la surveillance et l'analyse des données provenant de diverses sources en temps réel. Voici un aperçu des principales options disponibles dans cette interface :

### 1. **Search (Recherche)**
   - **Basic Search** : C'est l'outil principal de Splunk pour interroger vos données. Vous pouvez utiliser des termes de recherche simples ou des commandes plus avancées pour filtrer et manipuler les données.
   - **Search Commands** : Il existe une multitude de commandes que vous pouvez utiliser pour affiner vos recherches. Par exemple :
     - `stats` : Utilisé pour calculer des statistiques sur vos données.
     - `eval` : Pour créer de nouveaux champs ou modifier des champs existants.
     - `where` : Pour filtrer les résultats basés sur des conditions.
     - `table` : Pour afficher les résultats sous forme de tableau.

### 2. **Analytics (Analytique)**
   - **Dashboards** : Vous pouvez créer des tableaux de bord personnalisés qui visualisent vos données en temps réel à l'aide de graphiques, de diagrammes et d'autres visualisations. Les dashboards sont interactifs et peuvent être partagés avec d'autres utilisateurs.
   - **Reports** : Les rapports sont des recherches enregistrées qui peuvent être planifiées pour s'exécuter à des moments spécifiques. Ils peuvent être exportés ou envoyés par e-mail.
   - **Alerts (Alertes)** : Vous pouvez configurer des alertes qui se déclenchent lorsque certaines conditions sont remplies dans vos données, par exemple lorsqu'un seuil est atteint. Les alertes peuvent envoyer des notifications ou exécuter des actions prédéfinies.

### 3. **Visualization (Visualisation)**
   - **Charts and Graphs** : Splunk offre plusieurs options de visualisation pour vos données, comme des graphiques à barres, des graphiques linéaires, des diagrammes en camembert, des heatmaps, etc.
   - **Single Value** : Cette visualisation montre un seul chiffre clé, utile pour afficher des métriques importantes.
   - **Pivot** : L'outil Pivot permet de créer des rapports et des visualisations sans écrire de requêtes de recherche complexe, en sélectionnant des champs et en utilisant des options de regroupement et d'agrégation.

### 4. **Data Models (Modèles de données)**
   - **CIM (Common Information Model)** : Les modèles de données permettent de structurer les données non structurées et de les rendre plus exploitables pour les analyses. Splunk propose des CIMs pour normaliser les données, ce qui est particulièrement utile pour la création de rapports et d'alertes standardisés.
   - **Data Model Acceleration** : Permet d'améliorer les performances des recherches en pré-calculant et en stockant des données résumées.

### 5. **Knowledge Objects (Objets de connaissances)**
   - **Fields (Champs)** : Les champs sont des paires clé-valeur extraites des événements. Vous pouvez créer des champs personnalisés ou utiliser ceux détectés automatiquement par Splunk.
   - **Lookups (Recherches croisées)** : Ces fichiers permettent de faire correspondre des champs dans vos données avec des valeurs dans une autre source de données, souvent pour enrichir les événements avec des informations supplémentaires.
   - **Event Types** : Ce sont des regroupements d'événements basés sur des critères spécifiques, ce qui permet de catégoriser les événements pour des recherches et des analyses plus rapides.
   - **Tags** : Vous pouvez associer des tags à des événements ou à des objets pour les identifier plus facilement dans les recherches.

### 6. **Search Optimization (Optimisation des recherches)**
   - **Summary Indexing** : Utilisé pour stocker les résultats des recherches à long terme et réduire le temps de traitement des recherches ultérieures.
   - **Data Sampling** : Permet de travailler sur un sous-ensemble de vos données pour améliorer la vitesse des recherches pendant le développement de requêtes complexes.
   - **Search Scheduling** : Permet de planifier des recherches à exécuter à des moments précis, ce qui est utile pour les rapports réguliers ou les alertes.

Ces options constituent les fondements des capacités de recherche et de reporting dans Splunk, offrant une flexibilité considérable pour analyser les données en temps réel et tirer des informations exploitables.
