Dans Splunk, les assistants de recherche "Complet" et "Compact" sont deux modes d'affichage dans l'interface utilisateur qui aident les utilisateurs à interagir avec les résultats de leurs recherches de manière différente. Voici les différences principales entre ces deux modes :

### 1. **Assistant de recherche Complet (Verbose Mode)**
   - **Affichage des événements détaillés** : En mode complet, Splunk affiche tous les champs disponibles pour chaque événement trouvé. Cela signifie que vous voyez une vue détaillée de chaque événement, avec tous les champs extraits, y compris ceux qui ne sont pas explicitement mentionnés dans la recherche.
   - **Extraction de tous les champs** : Splunk extrait dynamiquement tous les champs des événements au moment de la recherche, ce qui peut fournir des informations très détaillées, mais aussi augmenter le temps de traitement.
   - **Utilisation intensive des ressources** : Ce mode est plus gourmand en ressources (CPU, mémoire) parce qu'il nécessite une extraction complète de tous les champs, ce qui peut ralentir les recherches, surtout sur de grandes quantités de données.
   - **Contexte d'utilisation** : Le mode complet est utile lorsque vous explorez des données pour la première fois, que vous ne savez pas exactement quels champs seront pertinents, ou que vous avez besoin d'une vue très détaillée des événements.

### 2. **Assistant de recherche Compact (Fast Mode)**
   - **Affichage des événements condensés** : En mode compact, Splunk limite l'affichage aux champs les plus essentiels ou seulement à ceux explicitement mentionnés dans la recherche. Cela rend l'affichage plus concis et rapide.
   - **Extraction minimale des champs** : Splunk extrait uniquement les champs nécessaires pour la recherche et l'affichage, ce qui réduit la charge sur les ressources du système et accélère le temps de réponse.
   - **Performance améliorée** : Ce mode est plus rapide et moins exigeant en ressources, car il réduit la quantité de données extraites et traitées.
   - **Contexte d'utilisation** : Le mode compact est idéal lorsque vous savez exactement quels champs vous recherchez ou lorsque vous travaillez avec de grands volumes de données et avez besoin de résultats rapides.

### **Résumé des différences** :
- **Assistant de recherche Complet (Verbose)** : Fournit une vue détaillée avec tous les champs extraits, utile pour une exploration approfondie des données, mais plus lent et plus gourmand en ressources.
- **Assistant de recherche Compact (Fast)** : Fournit une vue condensée avec uniquement les champs essentiels, idéal pour des recherches rapides ou lorsque vous avez une idée précise des champs nécessaires.

En choisissant entre ces deux modes, vous pouvez adapter l'affichage des résultats de recherche en fonction de vos besoins spécifiques : une exploration approfondie avec des détails complets ou une analyse rapide avec un affichage condensé.