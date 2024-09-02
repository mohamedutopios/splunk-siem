Dans Splunk, les commandes **`table`** et **`pivot`** sont deux outils puissants utilisés pour organiser et présenter les données, mais elles servent des objectifs légèrement différents.

### 1. **`table` Command**

La commande `table` dans Splunk est utilisée pour structurer les résultats d'une recherche en un tableau lisible avec des colonnes spécifiques. Cette commande est particulièrement utile lorsque vous souhaitez afficher uniquement certains champs d'événements dans une mise en page tabulaire.

#### Caractéristiques :
- **Affichage des Champs** : La commande `table` vous permet de sélectionner les champs que vous souhaitez afficher. Par exemple, si vous avez des données d'événements contenant de nombreux champs, mais que vous ne voulez afficher que quelques-uns, `table` est l'outil à utiliser.
- **Ordre des Colonnes** : Les colonnes dans le tableau apparaissent dans l'ordre où vous les spécifiez dans la commande.
- **Sans Transformation** : `table` n'effectue pas de calculs ni de transformations sur les données ; elle se contente de les afficher de manière organisée.

#### Exemple :
Supposons que vous avez des événements avec les champs `host`, `source`, `sourcetype`, et `count`. Vous pouvez utiliser la commande `table` comme suit :

```spl
index=main | stats count by host, source | table host, source, count
```

Cela affichera un tableau avec trois colonnes : `host`, `source`, et `count`.

### 2. **`pivot` Command**

La commande `pivot` dans Splunk est utilisée pour créer des rapports et des visualisations à partir des modèles de données sans avoir besoin d'écrire des recherches SPL (Search Processing Language) complexes. C'est un outil plus avancé que `table`, conçu pour une analyse plus approfondie des données.

#### Caractéristiques :
- **Analyse Multidimensionnelle** : `pivot` permet de créer des tableaux croisés dynamiques similaires à ceux que l'on trouve dans Excel, en regroupant les données par différents champs et en les résumant selon des métriques spécifiques.
- **Utilisation des Modèles de Données** : `pivot` travaille sur les modèles de données Splunk, qui sont des représentations structurées de vos données non structurées. Vous pouvez créer des rapports sans connaître SPL en sélectionnant simplement les dimensions et les mesures à inclure.
- **Visualisation** : Les résultats de `pivot` peuvent être facilement convertis en graphiques, ce qui est utile pour créer des tableaux de bord et des rapports interactifs.

#### Exemple :
Supposons que vous souhaitez analyser les événements par `host` et `sourcetype`, et calculer la somme des champs `bytes` pour chaque combinaison. Vous pourriez utiliser `pivot` comme suit :

```spl
| pivot datamodel_name dataset_name sum(bytes) as "Total Bytes" SPLITROW host as "Host" SPLITCOL sourcetype as "Source Type"
```

Cela génère une table pivotée où chaque `host` est une ligne et chaque `sourcetype` est une colonne, avec la somme des `bytes` dans les cellules correspondantes.

### Comparaison :
- **`table`** : Simple et direct, utilisé pour afficher des données sous forme de tableau en sélectionnant les champs pertinents.
- **`pivot`** : Plus complexe et puissant, utilisé pour effectuer des analyses multidimensionnelles et créer des rapports interactifs basés sur des modèles de données.

En résumé, utilisez **`table`** pour créer des tableaux simples et rapides avec des champs spécifiques, et utilisez **`pivot`** pour des analyses plus avancées avec des regroupements, des agrégations et des visualisations sophistiquées.