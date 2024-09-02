Le "verbose mode" dans Splunk fait référence à un mode de recherche qui offre un niveau de détail maximal sur les événements trouvés lors d'une recherche. Ce mode est principalement utilisé dans l'interface utilisateur de Splunk, en particulier dans le **Search & Reporting** app, lorsque vous effectuez des recherches sur des données indexées.

### Caractéristiques du "Verbose Mode" :

1. **Affichage complet des événements** :
   - Dans le verbose mode, Splunk affiche tous les champs disponibles pour chaque événement trouvé. Cela signifie que vous obtenez une vue très détaillée de chaque événement, avec toutes les informations et métadonnées qui y sont associées.

2. **Extraction des champs en temps réel** :
   - Splunk extrait tous les champs disponibles pour chaque événement au moment où la recherche est effectuée. Cela peut inclure des champs extraits dynamiquement à partir des données non structurées, en plus des champs déjà indexés.

3. **Affichage des statistiques et des graphiques** :
   - Outre les événements individuels, le verbose mode peut également afficher des statistiques globales et des visualisations, mais l'accent est mis sur le détail des événements individuels.

4. **Utilisation intensive des ressources** :
   - Parce que le verbose mode extrait tous les champs et affiche tous les détails, il est plus intensif en termes de ressources (CPU, mémoire) et peut être plus lent que les autres modes de recherche.

### Quand utiliser le "Verbose Mode" ?

- **Débogage** : Le verbose mode est utile lorsque vous explorez les données pour comprendre leur structure ou pour identifier des champs spécifiques à utiliser dans des recherches ou des rapports plus ciblés.
- **Analyse exploratoire** : Lors de l'analyse exploratoire, où vous n'êtes pas sûr des champs disponibles ou des données à extraire, le verbose mode vous donne une vue complète.
- **Validation** : Si vous devez valider la présence et la structure des données après l'ingestion ou l'indexation, le verbose mode vous montre exactement ce qui est disponible.

### Autres modes de recherche pour comparaison :

- **Fast Mode** : Splunk minimise l'extraction des champs, ne montrant que les champs essentiels, ce qui rend les recherches plus rapides mais moins détaillées.
- **Smart Mode** : Ce mode se situe entre le verbose et le fast mode. Splunk décide dynamiquement quels champs extraire et afficher en fonction de la recherche spécifique, optimisant ainsi la performance tout en fournissant suffisamment de détails pour des recherches typiques.

En résumé, le "verbose mode" dans Splunk est utilisé pour obtenir une vue très détaillée des événements avec tous les champs disponibles, ce qui est utile pour l'analyse approfondie des données, bien que cela puisse ralentir les recherches en raison de l'extraction intensive des données.