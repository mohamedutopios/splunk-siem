---
marp: true
title: SIEM
theme: utopios
paginate: true
author: Mohamed Aijjou
header: "![h:70px](https://utopios-marp-assets.s3.eu-west-3.amazonaws.com/logo_blanc.svg)"
footer: "Utopios® Tous droits réservés"
---


<!-- _class: lead -->
<!-- _paginate: false -->

# SIEM

---

## Sommaire


<div style="font-size:35px">


- Introduction au SIEM
- Composants d'un SIEM
- Deploiement et configuration d'un SIEM
- Surveillance et gestion des incidents au sein d'un SIEM
- Exemple de SIEM avec Splunk


</div>

--- 


<!-- _class: lead -->
<!-- _paginate: false -->

## Introduction au SIEM

---

## Introduction au SIEM

**Definition**

<div style="font-size:30px">

- Le **SIEM** (Security Information and Event Management) est une solution logicielle utilisée pour centraliser, surveiller, et analyser les informations de sécurité en temps réel à partir de diverses sources au sein d'une infrastructure informatique. 
- Le SIEM combine deux fonctionnalités principales : la gestion des informations de sécurité (SIM - Security Information Management) et la gestion des événements de sécurité (SEM - Security Event Management).

</div>

 
--- 

## Introduction au SIEM

**Rôle**

<div style="font-size:20px">

### **1. Collecte et Agrégation des Données**
   - **Centralisation des Logs :** Le SIEM collecte des données de sécurité provenant de diverses sources telles que les pare-feu, les systèmes d'exploitation, les applications, les bases de données, et les dispositifs de réseau. Cette centralisation permet d'avoir une vue d'ensemble de l'activité de sécurité au sein de l'infrastructure.
   - **Normalisation des Données :** Les données provenant de différentes sources sont souvent dans des formats variés. Le SIEM normalise ces données, facilitant ainsi leur analyse et leur corrélation.

### **2. Surveillance en Temps Réel**
   - **Détection des Menaces en Temps Réel :** Le SIEM surveille en continu l'ensemble des événements de sécurité et peut détecter des menaces ou des comportements suspects en temps réel. Grâce à cette surveillance constante, il est possible de repérer rapidement des activités anormales, comme des tentatives de connexion suspectes ou un accès non autorisé à des données sensibles.
   - **Alertes Automatisées :** Lorsqu'un comportement anormal est détecté, le SIEM génère automatiquement des alertes qui sont envoyées aux analystes de sécurité pour une investigation plus approfondie.

</div>

---
## Introduction au SIEM

**Rôle**

<div style="font-size:18px">

### **3. Corrélation des Événements**
   - **Analyse Contextuelle :** Le SIEM corrèle les événements de sécurité en fonction de règles prédéfinies ou dynamiques, permettant d'identifier des incidents de sécurité potentiellement complexes qui peuvent passer inaperçus autrement. Par exemple, une série de tentatives de connexion échouées suivie d'une connexion réussie pourrait indiquer une attaque par force brute.
   - **Détection d'Incidents Multi-Étapes :** Les cyberattaques modernes sont souvent complexes et se déroulent en plusieurs étapes. Le SIEM est capable de corréler des événements sur plusieurs sources et dans le temps pour détecter ces attaques multi-étapes.

### **4. Gestion des Incidents**
   - **Identification et Classification :** Une fois une menace détectée, le SIEM aide à identifier la nature de l'incident, à le classer selon sa gravité, et à prioriser la réponse en fonction de son impact potentiel sur l'organisation.
   - **Investigation :** Le SIEM fournit des outils pour analyser les incidents en profondeur, en permettant de retracer les activités suspectes à travers les différents systèmes et de collecter des preuves. Cela aide les analystes à comprendre la portée de l'incident et à identifier les systèmes affectés.
   - **Réponse Automatisée :** Certains SIEM sont intégrés avec des solutions SOAR (Security Orchestration, Automation, and Response) pour automatiser la réponse à certains types d'incidents. Par exemple, une connexion suspecte pourrait déclencher automatiquement le blocage d'une adresse IP ou la désactivation d'un compte utilisateur compromis.

</div>

---

## Introduction au SIEM

**Rôle**

<div style="font-size:18px">

### **5. Rétroaction et Amélioration Continue**
   - **Retour d'Expérience :** Après la gestion d'un incident, le SIEM peut être utilisé pour analyser les causes profondes et identifier les failles de sécurité. Cela permet de renforcer les défenses et d'éviter que des incidents similaires ne se reproduisent.
   - **Optimisation des Règles de Corrélation :** Les informations recueillies lors de la gestion d'un incident peuvent être utilisées pour affiner et améliorer les règles de corrélation du SIEM, réduisant ainsi les faux positifs et augmentant la précision des détections futures.

### **6. Reporting et Conformité**
   - **Documentation des Incidents :** Le SIEM permet de documenter chaque incident de sécurité, en conservant un historique des événements, des analyses et des actions entreprises. Cette documentation est essentielle pour la conformité réglementaire et pour les audits de sécurité.
   - **Génération de Rapports :** Le SIEM peut générer des rapports détaillés sur les incidents de sécurité, la conformité aux régulations, et les performances des mesures de sécurité. Ces rapports sont utiles pour la direction, les équipes de conformité, et les parties prenantes externes.

</div>

---

## Introduction au SIEM

**Rôle**

<div style="font-size:25px">

### **7. Intégration avec d'autres Outils de Sécurité**
   - **Orchestration avec des Solutions de Sécurité :** Le SIEM s'intègre souvent avec d'autres outils de sécurité comme les pare-feu, les systèmes de détection d'intrusion (IDS/IPS), et les solutions de gestion des vulnérabilités. Cette intégration permet une gestion plus cohérente et efficace des incidents.
   - **Enrichissement avec la Threat Intelligence :** Le SIEM peut être enrichi avec des informations provenant de sources de threat intelligence, ce qui améliore sa capacité à détecter et à évaluer les menaces connues et émergentes.

</div>

---


## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:25px">

### **Fonctionnalités Clés du SIEM : Collecte et Agrégation des Logs**

La collecte et l'agrégation des logs sont des fonctionnalités centrales d'un SIEM (Security Information and Event Management). Ces fonctionnalités permettent de centraliser et de normaliser les données provenant de diverses sources au sein de l'infrastructure informatique.

</div>

---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:18px">

### **1. Collecte des Logs**

#### **a. Sources de Logs**
   - **Dispositifs Réseau :** Les pare-feu, les routeurs, les commutateurs, les IDS/IPS, et d'autres dispositifs réseau génèrent des logs contenant des informations sur le trafic réseau, les tentatives de connexion, les blocages de paquets, etc.
   - **Systèmes d'Exploitation :** Les serveurs et les postes de travail sous Windows, Linux, ou macOS génèrent des logs sur les événements système tels que les connexions, les modifications de fichiers, les erreurs système, et plus encore.
   - **Applications :** Les applications critiques (bases de données, serveurs web, systèmes ERP/CRM, etc.) produisent des logs sur les activités des utilisateurs, les transactions, les accès aux données, etc.
   - **Sécurité :** Les logiciels de sécurité comme les antivirus, les solutions DLP (Data Loss Prevention), les solutions de gestion des identités et des accès (IAM) génèrent des logs sur les menaces détectées, les actions de sécurité, et les changements de configuration.
   - **Cloud et Environnements Virtuels :** Les services cloud (comme AWS, Azure) et les environnements de virtualisation (comme VMware, Hyper-V) produisent des logs sur les activités dans les machines virtuelles, les accès aux services cloud, etc.

</div>


---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:18px">

### **1. Collecte des Logs**

#### **b. Méthodes de Collecte**
   - **Agents de Collecte :** Des agents logiciels peuvent être installés sur les dispositifs et systèmes pour envoyer les logs au SIEM en temps réel. Ces agents peuvent également compresser et chiffrer les données avant de les envoyer.
   - **Syslog :** De nombreux dispositifs réseau et systèmes d'exploitation utilisent le protocole Syslog pour envoyer les logs. Le SIEM peut centraliser ces logs en écoutant sur les ports Syslog standard (UDP 514, TCP 514).
   - **API et Connecteurs :** Pour des applications spécifiques ou des services cloud, le SIEM peut utiliser des API ou des connecteurs dédiés pour collecter les logs.
   - **Collecte à Distance :** Les systèmes qui ne peuvent pas installer d'agents peuvent être configurés pour envoyer leurs logs à un collecteur de logs distant ou directement au SIEM.
  
</div>


---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:22px">

### **1. Collecte des Logs**

#### **c. Normalisation des Données**
   - **Standardisation des Formats :** Les logs provenant de différentes sources peuvent avoir des formats variés (texte, JSON, XML, etc.). Le SIEM normalise ces données en les transformant dans un format standardisé pour faciliter l'analyse.
   - **Extraction des Champs :** Le SIEM extrait les champs pertinents (comme l'adresse IP source, l'utilisateur, le type d'événement) des logs pour permettre une recherche et une corrélation efficaces.

</div>


---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:22px">

### **2. Agrégation des Logs**

#### **a. Centralisation des Données**
   - **Stockage Centralisé :** Le SIEM centralise les logs dans un dépôt unique, où ils peuvent être analysés en temps réel ou archivés pour une analyse ultérieure. Cette centralisation permet de disposer d'une vue globale et cohérente de la sécurité de l'infrastructure.
   - **Gestion des Logs en Volumes :** Le SIEM est conçu pour gérer des volumes massifs de données de logs, souvent mesurés en téraoctets par jour, provenant de milliers de sources différentes.

</div>


---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:22px">

### **2. Agrégation des Logs**

#### **b. Consolidation des Événements**
   - **Élimination des Redondances :** Lorsqu'un même événement est signalé par plusieurs sources, le SIEM peut consolider ces événements pour éviter les doublons, réduisant ainsi le bruit et améliorant la précision des analyses.
   - **Corrélation Multisource :** L'agrégation des logs permet au SIEM de corréler des événements provenant de différentes sources pour identifier des incidents de sécurité complexes. Par exemple, une tentative de connexion échouée sur un serveur suivie d'une connexion réussie depuis une autre adresse IP pourrait indiquer une attaque par force brute.

</div>


---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:25px">

### **3. Enrichissement des Logs**
   - **Ajout de Contexte :** Le SIEM peut enrichir les logs avec des informations contextuelles, telles que les informations de géolocalisation des adresses IP, les informations de threat intelligence, ou des données sur les utilisateurs (rôles, permissions).
   - **Tagging et Catégorisation :** Les événements peuvent être catégorisés en fonction de leur type, de leur criticité, ou de leur source, ce qui aide à prioriser les incidents et à orienter les investigations.


</div>

---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:18px">

### **4. Sécurité et Intégrité des Logs**
   - **Chiffrement des Données :** Les logs, particulièrement ceux contenant des informations sensibles, peuvent être chiffrés pour garantir leur confidentialité à la fois en transit et au repos.
   - **Intégrité des Données :** Le SIEM peut inclure des mécanismes pour garantir l'intégrité des logs, en empêchant leur modification ou suppression non autorisée, ce qui est crucial pour les enquêtes forensiques et la conformité.

### **5. Archivage et Rétention des Logs**
   - **Conservation à Long Terme :** Pour des besoins de conformité ou d'analyse rétroactive, le SIEM permet d'archiver les logs pour une durée déterminée. Ces logs archivés peuvent être consultés en cas de besoin pour des audits ou des investigations.
   - **Politique de Rétention :** Le SIEM peut appliquer des politiques de rétention des logs, garantissant que les données sont stockées aussi longtemps que nécessaire pour respecter les obligations réglementaires ou les politiques internes de l'entreprise.


</div>


---

## Introduction au SIEM

**Fonctionnalités** : Collecte et Agrégation des Logs

<div style="font-size:25px">

### **6. Performance et Scalabilité**
   - **Scalabilité Horizontale :** Les SIEM modernes sont conçus pour s'adapter aux besoins croissants en matière de collecte de logs, permettant d'ajouter des capacités supplémentaires sans dégrader les performances.
   - **Gestion des Performances :** Le SIEM optimise l'utilisation des ressources pour traiter les logs en temps réel, assurant que les alertes critiques sont générées sans retard.


</div>

---


## Introduction au SIEM

**Fonctionnalités** : Corrélation d'Événements dans un SIEM

<div style="font-size:18px">

### **Corrélation d'Événements dans un SIEM : Fonctionnalités et Importance**

La **corrélation d'événements** est l'une des fonctionnalités les plus puissantes et essentielles d'un SIEM (Security Information and Event Management). Elle permet d'analyser et de relier des événements de sécurité apparemment indépendants pour identifier des incidents potentiels, des menaces complexes, ou des attaques qui ne seraient pas détectées en examinant chaque événement de manière isolée.

### **Qu'est-ce que la Corrélation d'Événements ?**

La corrélation d'événements consiste à combiner et à analyser des données provenant de multiples sources, en temps réel ou en différé, pour identifier des motifs, des anomalies, ou des chaînes d'événements qui pourraient indiquer une menace ou une activité malveillante. Le SIEM applique des règles, des algorithmes ou des modèles de machine learning pour établir des relations entre ces événements.

</div>


---



## Introduction au SIEM

**Fonctionnalités** : Corrélation d'Événements dans un SIEM

<div style="font-size:18px">

### **Types de Corrélation d'Événements**

1. **Corrélation Basée sur des Règles**
   - **Description :** Ce type de corrélation utilise des règles prédéfinies par les administrateurs de sécurité. Ces règles définissent les conditions spécifiques sous lesquelles des événements individuels sont liés pour déclencher une alerte.
   - **Exemple :** Une règle pourrait stipuler qu'une alerte doit être générée si un utilisateur tente de se connecter à un serveur cinq fois en une minute avec un mot de passe incorrect, suivi d'une connexion réussie à partir d'une adresse IP différente.
   
2. **Corrélation Temporelle**
   - **Description :** La corrélation temporelle analyse les événements qui se produisent dans une certaine période. Elle est particulièrement utile pour détecter des attaques qui se déroulent en plusieurs étapes sur une courte période.
   - **Exemple :** Détecter une série de connexions échouées suivies d'une tentative réussie quelques minutes plus tard, indiquant une potentielle attaque par force brute.


</div>

---


## Introduction au SIEM

**Fonctionnalités** : Corrélation d'Événements dans un SIEM

<div style="font-size:18px">

### **Types de Corrélation d'Événements**

3. **Corrélation Basée sur le Contexte**
   - **Description :** Cette méthode enrichit les événements avec des informations contextuelles supplémentaires (comme la géolocalisation, le rôle de l'utilisateur, l'heure de la journée) pour déterminer si une activité est normale ou suspecte.
   - **Exemple :** Une tentative de connexion à partir d'une adresse IP en Russie par un utilisateur habituellement basé aux États-Unis pourrait être considérée comme suspecte.

4. **Corrélation Basée sur des Scénarios**
   - **Description :** Cette approche identifie des chaînes d'événements qui, ensemble, correspondent à un scénario d'attaque connu. Cela peut inclure des attaques multi-étapes telles que l'escalade de privilèges, la persistance, et l'exfiltration de données.
   - **Exemple :** Une élévation de privilèges suivie de la création d'un nouvel utilisateur administrateur et d'une extraction massive de données pourrait signaler une compromission de compte interne.


</div>


---

## Introduction au SIEM

**Fonctionnalités** : Corrélation d'Événements dans un SIEM

<div style="font-size:25px">

### **Types de Corrélation d'Événements**

5. **Corrélation Basée sur le Machine Learning**
   - **Description :** Les SIEM modernes intègrent des modèles de machine learning pour corréler des événements en détectant des anomalies par rapport à des comportements habituels ou en identifiant des schémas complexes d'attaques inconnues.
   - **Exemple :** Détecter des activités qui ne correspondent pas aux comportements habituels de l'utilisateur, comme une tentative de connexion à des heures inhabituelles ou l'accès à des ressources rarement utilisées.

</div>



---


## Introduction au SIEM

**Fonctionnalités** : Corrélation d'Événements dans un SIEM

<div style="font-size:18px">

### **Importance de la Corrélation d'Événements**

1. **Détection des Menaces Complexes**
   - **Identification des Attaques Multi-Étapes :** Les attaques sophistiquées se déroulent souvent en plusieurs étapes (reconnaissance, exploitation, exfiltration de données). La corrélation d'événements permet de lier ces étapes pour identifier une menace qui, autrement, passerait inaperçue.
   - **Réduction des Faux Positifs :** En corrélant des événements apparemment anodins mais liés, le SIEM peut réduire le nombre de fausses alertes, ce qui permet aux analystes de se concentrer sur les incidents réellement critiques.

2. **Réduction du Temps de Réponse**
   - **Alertes Priorisées :** La corrélation d'événements aide à prioriser les alertes en fonction de la gravité et de la probabilité d'une attaque réelle, permettant une réponse plus rapide et plus efficace.
   - **Automatisation de la Réponse :** En identifiant rapidement des menaces par corrélation, certaines réponses peuvent être automatisées (par exemple, bloquer une adresse IP suspecte), réduisant ainsi le temps nécessaire pour contrer une attaque.


</div>


---


## Introduction au SIEM

**Fonctionnalités** : Corrélation d'Événements dans un SIEM

<div style="font-size:18px">

### **Importance de la Corrélation d'Événements**

3. **Enrichissement de l'Analyse Forensique**
   - **Chaînes d'Événements Liées :** Lors d'une investigation après incident, la corrélation permet de retracer les événements liés qui ont conduit à la compromission, fournissant une vue complète et cohérente de l'incident.
   - **Documentation des Incidents :** Les incidents peuvent être documentés avec une chronologie précise des événements corrélés, ce qui est crucial pour les audits de sécurité et les enquêtes légales.

4. **Amélioration Continue de la Sécurité**
   - **Adaptation aux Nouvelles Menaces :** En analysant régulièrement les modèles de corrélation d'événements, les équipes de sécurité peuvent ajuster et améliorer les règles pour s'adapter aux nouvelles menaces émergentes.
   - **Feedback et Optimisation :** Les résultats des corrélations peuvent être utilisés pour optimiser les règles existantes et améliorer la détection à l'avenir.
   - 
</div>


---

## Introduction au SIEM

**Fonctionnalités** : Corrélation d'Événements dans un SIEM

<div style="font-size:17px">

### **Scénario : Tentative de Compromission d'un Compte Administrateur**

1. **Événements Individuels :**
   - Tentative de connexion échouée sur un serveur critique par un compte administrateur.
   - Connexion réussie avec ce même compte depuis une adresse IP différente.
   - Changement de configuration sur le serveur (ex : création d'un nouveau compte administrateur).
   - Augmentation soudaine du trafic de données sortant du serveur vers une adresse IP externe inconnue.

2. **Corrélation d'Événements :**
   - Le SIEM corrèle ces événements et détecte un motif commun : une possible compromission de compte, suivie d'une escalade de privilèges et d'une exfiltration de données.
   - Une alerte est générée, classée comme critique, et immédiatement envoyée à l'équipe de sécurité pour une réponse rapide.

3. **Réponse :**
   - Le SOC isole immédiatement le serveur compromis, réinitialise les mots de passe du compte administrateur, et lance une analyse forensique pour évaluer l'étendue de la compromission.
   - Une investigation plus approfondie est lancée pour identifier l'origine de l'attaque et s'assurer qu'il n'y a pas d'autres systèmes compromis.

</div>


---



## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:25px">

### **Fonctionnalités de la Surveillance en Temps Réel**

La **surveillance en temps réel** est une fonctionnalité essentielle d'un SIEM (Security Information and Event Management). Elle permet aux organisations de détecter et de répondre immédiatement aux incidents de sécurité en cours. Grâce à cette capacité, un SIEM peut identifier des menaces potentielles, générer des alertes en direct, et déclencher des actions automatisées ou manuelles pour atténuer les risques avant qu'ils ne causent des dommages significatifs.

</div>


---

## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:18px">

1. **Collecte Instantanée des Logs**
   - **Capture Continue :** Le SIEM collecte en permanence les logs provenant de diverses sources (pare-feu, systèmes d'exploitation, applications, etc.) sans interruption, ce qui garantit que chaque événement est enregistré en temps réel.
   - **Streaming des Données :** Les données de sécurité sont transmises au SIEM presque immédiatement après leur génération, permettant une analyse rapide.

2. **Analyse et Détection en Temps Réel**
   - **Moteur de Corrélation Instantanée :** Le SIEM utilise des règles de corrélation et des algorithmes pour analyser les événements dès qu'ils sont reçus, détectant ainsi immédiatement des anomalies ou des comportements suspects.
   - **Détection des Anomalies :** En plus des règles prédéfinies, certains SIEM intègrent des technologies de machine learning pour détecter des anomalies en temps réel, en se basant sur des modèles de comportement normaux.

</div>


---

## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:18px">

3. **Génération d'Alertes Instantanées**
   - **Alertes en Direct :** Lorsqu'une menace potentielle est identifiée, le SIEM génère instantanément une alerte. Ces alertes peuvent être personnalisées pour refléter différents niveaux de sévérité et de criticité.
   - **Notifications Multicanal :** Les alertes peuvent être envoyées via divers canaux (email, SMS, tableaux de bord SOC, intégration avec des outils de ticketing) pour s'assurer que les équipes de sécurité réagissent rapidement.

4. **Tableaux de Bord Dynamiques**
   - **Visualisation en Temps Réel :** Le SIEM offre des tableaux de bord interactifs qui affichent en temps réel l'état de la sécurité de l'infrastructure. Les analystes peuvent voir des graphiques, des cartes de chaleur, et d'autres visualisations qui se mettent à jour instantanément en fonction des nouvelles données.
   - **Personnalisation :** Les tableaux de bord peuvent être personnalisés pour différents rôles au sein de l'organisation, permettant à chaque utilisateur de surveiller les aspects de sécurité les plus pertinents pour ses responsabilités.

</div>


---

## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:18px">


5. **Réponse Automatisée en Temps Réel**
   - **Orchestration de la Réponse :** Certains SIEM sont intégrés avec des solutions SOAR (Security Orchestration, Automation, and Response) qui permettent de déclencher des actions automatisées en réponse à des alertes en temps réel, comme le blocage d'une adresse IP suspecte, l'isolement d'un système compromis, ou la désactivation d'un compte utilisateur.
   - **Playbooks de Sécurité :** Des playbooks prédéfinis peuvent être exécutés automatiquement ou semi-automatiquement en fonction de scénarios spécifiques détectés en temps réel.

6. **Surveillance des Menaces Émergentes**
   - **Intégration avec des Feeds de Threat Intelligence :** En temps réel, le SIEM peut intégrer des données de threat intelligence pour comparer les événements de sécurité avec des indicateurs de compromission (IOC) connus, ce qui aide à identifier les menaces émergentes.
   - **Mise à Jour Dynamique des Règles :** Les règles de corrélation et les modèles de détection peuvent être mis à jour en temps réel pour refléter les nouvelles menaces détectées à travers les feeds de threat intelligence.

</div>

---
## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:18px">


5. **Réponse Automatisée en Temps Réel**
   - **Orchestration de la Réponse :** Certains SIEM sont intégrés avec des solutions SOAR (Security Orchestration, Automation, and Response) qui permettent de déclencher des actions automatisées en réponse à des alertes en temps réel, comme le blocage d'une adresse IP suspecte, l'isolement d'un système compromis, ou la désactivation d'un compte utilisateur.
   - **Playbooks de Sécurité :** Des playbooks prédéfinis peuvent être exécutés automatiquement ou semi-automatiquement en fonction de scénarios spécifiques détectés en temps réel.

6. **Surveillance des Menaces Émergentes**
   - **Intégration avec des Feeds de Threat Intelligence :** En temps réel, le SIEM peut intégrer des données de threat intelligence pour comparer les événements de sécurité avec des indicateurs de compromission (IOC) connus, ce qui aide à identifier les menaces émergentes.
   - **Mise à Jour Dynamique des Règles :** Les règles de corrélation et les modèles de détection peuvent être mis à jour en temps réel pour refléter les nouvelles menaces détectées à travers les feeds de threat intelligence.

</div>

---
## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:18px">

### **Importance de la Surveillance en Temps Réel**

1. **Détection Précoce des Menaces**
   - **Identification Immédiate des Incidents :** La surveillance en temps réel permet d'identifier immédiatement les incidents de sécurité dès qu'ils se produisent, réduisant ainsi la fenêtre de temps pendant laquelle une attaque peut passer inaperçue.
   - **Réduction des Temps de Réaction :** En étant alerté en temps réel, le SOC peut réagir plus rapidement, empêchant ainsi les attaquants de progresser dans leur attaque et limitant les dégâts potentiels.

2. **Prévention des Dommages**
   - **Réponse Immédiate :** En cas d'incident critique, une réponse immédiate peut être déclenchée pour limiter les impacts, comme l'arrêt des systèmes, l'isolement des réseaux ou la désactivation des accès compromis.
   - **Mitigation des Risques :** Les actions en temps réel, comme le blocage automatique de certaines activités suspectes, aident à mitiger les risques avant qu'ils ne se transforment en incidents majeurs.


</div>


---
## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:25px">

### **Importance de la Surveillance en Temps Réel**

3. **Amélioration Continue de la Sécurité**
   - **Feedback Immédiat :** Les incidents détectés en temps réel fournissent un feedback immédiat aux équipes de sécurité, permettant d'ajuster les règles de détection et de réponse pour améliorer continuellement la posture de sécurité.
   - **Évolution avec les Menaces :** La capacité à détecter et à réagir en temps réel aide les organisations à s'adapter rapidement aux nouvelles menaces et aux techniques d'attaque émergentes.

</div>

---
## Introduction au SIEM

**Fonctionnalités** : Surveillance en Temps Réel dans un SIEM

<div style="font-size:13px">

#### **Scénario : Attaque DDoS (Distributed Denial of Service)**

1. **Détection Initiale :**
   - Le SIEM collecte en temps réel des logs provenant des pare-feu, des routeurs, et des serveurs d'application.
   - Une augmentation soudaine du trafic réseau provenant de plusieurs adresses IP sur un serveur web critique est détectée.

2. **Analyse et Corrélation :**
   - Le SIEM applique des règles de corrélation pour identifier cette augmentation anormale du trafic comme un potentiel début d'attaque DDoS.
   - Il compare les adresses IP suspectes avec des listes noires provenant de feeds de threat intelligence et confirme que certaines d'entre elles sont associées à des botnets connus.

3. **Génération d'Alerte et Réponse :**
   - Une alerte critique est immédiatement générée et envoyée aux analystes de sécurité du SOC.
   - Simultanément, une action automatisée est déclenchée : les adresses IP identifiées comme malveillantes sont bloquées au niveau du pare-feu, et le trafic vers le serveur web est redirigé vers un service de mitigation DDoS.

4. **Surveillance Continue :**
   - Les tableaux de bord en temps réel du SIEM continuent de surveiller le trafic réseau pour s'assurer que l'attaque est sous contrôle.
   - Le SIEM ajuste automatiquement les règles de détection pour affiner la réponse en fonction des nouveaux schémas de trafic observés.

5. **Post-Incident :**
   - Une fois l'attaque contenue, les logs collectés en temps réel sont analysés pour améliorer les défenses contre de futures attaques DDoS.
   - Le SOC documente l'incident, incluant les détails de la réponse en temps réel, pour les audits et les révisions de sécurité.

</div>

---

## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:25px">

### **Reporting et Conformité dans un SIEM**

Le **reporting et la conformité** sont des aspects cruciaux du fonctionnement d'un SIEM (Security Information and Event Management). Ils permettent non seulement de répondre aux exigences réglementaires mais aussi de fournir une visibilité continue sur l'état de la sécurité de l'organisation. Voici un aperçu des fonctionnalités liées au reporting et à la conformité dans un SIEM.

</div>


---
## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:20px">

### **1. Reporting dans un SIEM**

#### **a. Génération de Rapports Automatisés**
   - **Rapports Personnalisables :** Le SIEM peut générer des rapports personnalisés en fonction des besoins spécifiques de l'organisation, tels que des rapports de sécurité hebdomadaires, mensuels, ou après chaque incident.
   - **Rapports en Temps Réel et Programmés :** Les rapports peuvent être générés en temps réel pour une surveillance continue, ou programmés pour être créés et distribués à intervalles réguliers, par exemple chaque fin de mois ou après des audits spécifiques.
   - **Tableaux de Bord Interactifs :** En plus des rapports statiques, les SIEM offrent des tableaux de bord interactifs où les données peuvent être explorées en détail, fournissant ainsi une vue dynamique de l'état de la sécurité.

</div>



---
## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:18px">

### **1. Reporting dans un SIEM**

#### **b. Types de Rapports**
   - **Rapports de Sécurité :** Incluent les détails sur les incidents détectés, les menaces potentielles, les vulnérabilités identifiées, et les tendances globales de la sécurité.
   - **Rapports d'Activité :** Suivent l'activité des utilisateurs, les tentatives de connexion, les changements de configuration, et d'autres événements critiques pour la sécurité.
   - **Rapports d'Incident :** Fournissent une analyse détaillée des incidents de sécurité, y compris la chronologie des événements, l'impact, et les mesures de réponse.
   - **Rapports de Performance :** Évaluent l'efficacité des contrôles de sécurité et des stratégies mises en place, et identifient les domaines nécessitant des améliorations.
   - **Rapports de Conformité :** Conçus pour démontrer que l'organisation respecte les exigences réglementaires et les normes de sécurité.

</div>


---
## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:18px">

### **1. Reporting dans un SIEM**

#### **c. Distribution et Partage des Rapports**
   - **Exportation et Partage :** Les rapports peuvent être exportés dans différents formats (PDF, Excel, CSV) pour être partagés avec les parties prenantes internes ou externes.
   - **Intégration avec les Outils de Gestion :** Les rapports peuvent être intégrés dans des systèmes de gestion des incidents ou des plateformes de collaboration pour un suivi efficace et une gestion centralisée.

</div>


---
## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:20px">

### **2. Conformité dans un SIEM**

#### **a. Gestion de la Conformité Réglementaire**
   - **Règles et Modèles Préconfigurés :** Le SIEM inclut souvent des règles et des modèles de rapports préconfigurés pour des régulations spécifiques telles que GDPR (Règlement Général sur la Protection des Données), PCI-DSS (Payment Card Industry Data Security Standard), HIPAA (Health Insurance Portability and Accountability Act), SOX (Sarbanes-Oxley Act), etc.
   - **Surveillance de la Conformité :** Le SIEM surveille en temps réel les activités et les configurations du système pour assurer la conformité continue avec les régulations. Il peut également générer des alertes lorsque des actions non conformes sont détectées.

</div>

---

## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:20px">

### **2. Conformité dans un SIEM**

#### **b. Audits de Sécurité et Pistes d'Audit**
   - **Enregistrement des Événements :** Tous les événements de sécurité, les changements de configuration, et les accès utilisateurs sont enregistrés et archivés, créant une piste d'audit exhaustive.
   - **Requêtes d'Audit :** Le SIEM permet de rechercher et d'analyser les événements historiques pour répondre aux demandes d'audit ou pour les enquêtes post-incident.
   - **Rapports d'Audit :** Des rapports spécifiques aux audits peuvent être générés pour démontrer la conformité aux exigences légales et réglementaires, incluant des détails sur les accès, les modifications, et les incidents de sécurité.

</div>

---

## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:25px">

### **2. Conformité dans un SIEM**


#### **c. Politiques de Rétention et Archivage**
   - **Conservation des Données :** Le SIEM permet de définir des politiques de rétention des logs et des événements pour s'assurer que les données sont conservées pendant la durée nécessaire pour répondre aux exigences réglementaires.
   - **Archivage Sécurisé :** Les données archivées sont sécurisées par des méthodes de chiffrement et d'intégrité pour garantir qu'elles restent intactes et accessibles pour les audits futurs.

</div>

---
## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:18px">

### **3. Importance du Reporting et de la Conformité dans un SIEM**

#### **a. Assurance de Conformité**
   - **Réponse aux Exigences Légales :** Le SIEM aide les organisations à respecter les obligations légales et réglementaires, en s'assurant que toutes les activités de sécurité sont enregistrées, surveillées, et conformes aux normes.
   - **Réduction des Risques Juridiques :** En assurant une conformité stricte, le SIEM réduit le risque d'amendes, de sanctions, et de poursuites légales associées à la non-conformité.

#### **b. Visibilité et Transparence**
   - **Évaluation Continue :** Le reporting régulier permet aux dirigeants de l'organisation de comprendre l'état de la sécurité et de prendre des décisions éclairées basées sur des données précises.
   - **Transparence pour les Parties Prenantes :** Les rapports de conformité offrent une transparence sur la manière dont l'organisation gère la sécurité des informations, ce qui est essentiel pour les clients, les partenaires, et les régulateurs.

</div>

---

## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:25px">

### **3. Importance du Reporting et de la Conformité dans un SIEM**


#### **c. Amélioration Continue**
   - **Identification des Faiblesses :** Les rapports de performance et de conformité permettent d'identifier les faiblesses des systèmes de sécurité et les lacunes dans la conformité, ce qui guide les efforts d'amélioration continue.
   - **Adaptation aux Changements Réglementaires :** Le SIEM aide à suivre l'évolution des régulations et à adapter rapidement les politiques de sécurité pour rester conforme.

</div>

---

## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:25px">

### **3. Importance du Reporting et de la Conformité dans un SIEM**


#### **c. Amélioration Continue**
   - **Identification des Faiblesses :** Les rapports de performance et de conformité permettent d'identifier les faiblesses des systèmes de sécurité et les lacunes dans la conformité, ce qui guide les efforts d'amélioration continue.
   - **Adaptation aux Changements Réglementaires :** Le SIEM aide à suivre l'évolution des régulations et à adapter rapidement les politiques de sécurité pour rester conforme.

</div>

---

## Introduction au SIEM

**Fonctionnalités** : Reporting et Conformité dans un SIEM

<div style="font-size:14px">

#### **Scénario : Conformité PCI-DSS dans une Entreprise de Commerce en Ligne**

1. **Surveillance Continue :**
   - Le SIEM surveille en temps réel toutes les transactions de paiement, les accès aux systèmes de traitement des cartes de crédit, et les configurations des dispositifs réseau.

2. **Rapports de Conformité PCI-DSS :**
   - Des rapports spécifiques PCI-DSS sont générés mensuellement pour vérifier que toutes les transactions sont conformes aux exigences de sécurité, comme le chiffrement des données de carte, la gestion des accès, et la surveillance des activités réseau.

3. **Audits de Sécurité :**
   - En préparation d'un audit annuel, le SIEM fournit une piste d'audit complète qui documente toutes les activités de sécurité liées au traitement des paiements, y compris les tentatives d'accès non autorisées et les incidents résolus.

4. **Notification d'Anomalies :**
   - Si un changement de configuration est détecté (par exemple, un pare-feu est désactivé), le SIEM génère une alerte et un rapport d'incident, qui sont immédiatement envoyés aux responsables de la conformité pour investigation.

5. **Archivage des Données :**
   - Les logs de transactions et les événements de sécurité sont archivés en toute sécurité pendant la durée requise par les régulations PCI-DSS, garantissant qu'ils sont disponibles pour des audits futurs.

</div>

---

<!-- _class: lead -->
<!-- _paginate: false -->

## Démarrage avec Quarkus

---

## Démarrage avec Quarkus

#### La Strcuture d'un projet Quarkus ?

<br>

<div style="font-size:35px">

La structure d'un projet Quarkus suit une organisation classique des projets Java basés sur Maven, mais avec quelques spécificités propres à Quarkus.

</div>

---

## Démarrage avec Quarkus

### Structure de base d'un projet Quarkus

<div style="font-size:23px">

```
quarkus-getting-started/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── org/
│   │   │       └── acme/
│   │   │           ├── GreetingResource.java
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── META-INF/
│   │   │   │   └── resources/
│   │   │   │       └── index.html
│   ├── test/
│   │   ├── java/
│   │   │   └── org/
│   │   │       └── acme/
│   │   │           ├── GreetingResourceTest.java
│   │   │           ├── NativeGreetingResourceIT.java
├── target/
├── .mvn/
├── mvnw
├── mvnw.cmd
├── pom.xml
└── README.md
```

</div>

---

## Démarrage avec Quarkus

### Détails de la structure

<div style="font-size:19px">

#### 1. `src/`

- **`main/`** : Contient le code source de l'application.
  - **`java/`** : C'est ici que réside le code Java principal de l'application.
    - **`org/acme/`** : Représente le package Java de base. Ce dossier suit la convention de nommage des packages Java en fonction du domaine de l'organisation. Dans cet exemple, `org.acme` est utilisé, mais il peut être remplacé par le nom de domaine réel de votre organisation.
      - **`GreetingResource.java`** : Un exemple de classe qui définit un service REST en utilisant JAX-RS. Les ressources REST sont généralement placées ici.
      
  - **`resources/`** : Contient les fichiers de configuration et les ressources statiques.
    - **`application.properties`** : Le fichier de configuration principal pour Quarkus. C'est ici que vous définissez les paramètres de configuration tels que les ports, les chemins de base, les configurations de la base de données, etc.
    - **`META-INF/resources/`** : Dossier pour les ressources statiques accessibles via le web. Par exemple, `index.html` sera accessible à l'adresse racine de votre application (ex: `http://localhost:8080/`)


</div>

---

## Démarrage avec Quarkus

### Détails de la structure

<div style="font-size:23px">

#### 1. `src/`

- **`test/`** : Contient les tests unitaires et d'intégration.
  - **`java/`** : Similaire au dossier `main/java`, mais pour les tests.
    - **`GreetingResourceTest.java`** : Test unitaire pour la ressource `GreetingResource`.
    - **`NativeGreetingResourceIT.java`** : Test d'intégration pour les tests en mode natif. Ce fichier est utilisé pour tester l'application lorsqu'elle est compilée en binaire natif via GraalVM.


</div>

--- 

## Démarrage avec Quarkus

### Détails de la structure

<div style="font-size:24px">

#### 2. Fichiers et dossiers à la racine

- **`target/`** : Dossier généré par Maven qui contient les artefacts compilés de l'application, y compris les fichiers `.class` et le fichier `.jar` final.
- **`.mvn/`, `mvnw`, `mvnw.cmd`** : Fichiers Maven Wrapper, qui permettent d'exécuter Maven sans nécessiter une installation préalable de Maven sur la machine de développement.
- **`pom.xml`** : Fichier de configuration Maven. Il contient les dépendances, les plugins, et les configurations spécifiques au projet Quarkus. C'est un élément clé du projet qui gère les dépendances et les tâches de build.
- **`README.md`** : Fichier de documentation qui peut être utilisé pour décrire le projet, ses objectifs, et fournir des instructions de configuration ou d'utilisation.


</div>

---

## Démarrage avec Quarkus

### Exemple de Contenu de `GreetingResource.java`

<div style="font-size:24px">

```java
package org.acme;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/hello")
public class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello, Quarkus!";
    }
}
```

</div>
    
---


## Démarrage avec Quarkus

### Exemple de Contenu de `application.properties`

<div style="font-size:30px">

```properties
quarkus.http.port=8080
quarkus.application.name=quarkus-getting-started
```

</div>

---


## Démarrage avec Quarkus

### Fonctionnement Global

<div style="font-size:30px">

- **Ressources REST :** Les ressources REST comme `GreetingResource` sont définies avec des annotations JAX-RS (`@Path`, `@GET`, etc.) et répondent aux requêtes HTTP.
- **Configuration :** Le fichier `application.properties` est utilisé pour configurer divers aspects de l'application, comme les paramètres de serveur, les profils de développement, et les intégrations avec des bases de données ou des services tiers.
- **Tests :** Les tests unitaires et d'intégration vérifient que les composants de l'application fonctionnent comme prévu.

</div>


---

## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:30px">

- La configuration dans Quarkus est principalement gérée via le fichier `application.properties`, qui se trouve dans le dossier `src/main/resources`. 
- Ce fichier permet de définir les propriétés globales de l'application ainsi que des configurations spécifiques pour différents environnements (profils).

</div>


---

## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:23px">

#### **1. Fichier `application.properties`**

Le fichier `application.properties` est utilisé pour configurer divers aspects de l'application, y compris les paramètres du serveur HTTP, les bases de données, la sécurité, et les configurations spécifiques aux extensions Quarkus.

##### **Exemples de configurations courantes :**

- **Configuration du port HTTP :**
  ```properties
  quarkus.http.port=8080
  ```

- **Nom de l'application :**
  ```properties
  quarkus.application.name=quarkus-getting-started
  ```

</div>

---

## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:20px">

#### **1. Fichier `application.properties`**

##### **Exemples de configurations courantes :**

- **Activation des logs SQL (pour Hibernate/JPA) :**
  ```properties
  quarkus.hibernate-orm.log.sql=true
  ```

- **Configuration de la datasource (JDBC) :**
  ```properties
  quarkus.datasource.db-kind=postgresql
  quarkus.datasource.username=postgres
  quarkus.datasource.password=secret
  quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/mydb
  ```

- **Activation de l'interface graphique OpenAPI (Swagger UI) :**
  ```properties
  quarkus.swagger-ui.always-include=true
  ```

</div>
    
---
## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:23px">

#### **2. Profils de Configuration**

Quarkus permet de définir des configurations spécifiques à des environnements via l'utilisation de profils. Les profils sont particulièrement utiles pour adapter la configuration en fonction de l'environnement de déploiement (développement, test, production).

##### **Définition des profils :**

- **Profil par défaut :** Les configurations définies sans spécifier de profil s'appliquent à tous les environnements. Par exemple :
  ```properties
  quarkus.http.port=8080
  ```

</div>

---
## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:23px">

#### **2. Profils de Configuration**

- **Profil spécifique :** Pour des configurations spécifiques à un profil, utilisez le format suivant : `quarkus.profile-nompropriete`. Par exemple :
  - **Profil de développement (`dev`) :**
    ```properties
    %dev.quarkus.http.port=8081
    %dev.quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/devdb
    ```
  - **Profil de production (`prod`) :**
    ```properties
    %prod.quarkus.http.port=80
    %prod.quarkus.datasource.jdbc.url=jdbc:postgresql://dbserver:5432/proddb
    ```
</div>

---

## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:25px">

#### **2. Profils de Configuration**

- **Activation d'un profil spécifique :**
  - Par défaut, Quarkus active le profil `dev` lorsque l'application est lancée en mode développement. Pour activer un autre profil, utilisez le paramètre `-Dquarkus.profile=<profil>` lors du démarrage de l'application :
  
    ```bash
    ./mvnw quarkus:dev -Dquarkus.profile=prod
    ```

</div>


---

## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:24px">

#### **3. Variables d'environnement et substitution**

Les propriétés peuvent également être définies via des variables d'environnement ou des options de ligne de commande, ce qui permet une plus grande flexibilité dans la configuration.

- **Utilisation de variables d'environnement :**
  - Dans `application.properties`, vous pouvez utiliser la syntaxe `${VARIABLE}` pour substituer les valeurs provenant des variables d'environnement.
  - Exemple :
    ```properties
    quarkus.datasource.username=${DB_USER:postgres}
    quarkus.datasource.password=${DB_PASSWORD:secret}
    ```
    Ici, `DB_USER` et `DB_PASSWORD` sont des variables d'environnement. Si elles ne sont pas définies, les valeurs par défaut `postgres` et `secret` sont utilisées.

</div>

---

## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:24px">

#### **3. Variables d'environnement et substitution**

- **Substitution via la ligne de commande :**
  - Vous pouvez également passer des propriétés directement via la ligne de commande lorsque vous lancez l'application :
    ```bash
    ./mvnw quarkus:dev -Dquarkus.datasource.username=customuser -Dquarkus.datasource.password=custompassword
    ```

</div>

---

## Démarrage avec Quarkus

### Configuration de base (application.properties, profils, etc.)

<div style="font-size:19px">

#### **4. Configuration des extensions Quarkus**

Chaque extension Quarkus que vous ajoutez à votre projet peut avoir des configurations spécifiques qui sont généralement définies dans `application.properties`. Par exemple :

- **Configuration de RESTEasy (pour les services REST) :**
  ```properties
  quarkus.resteasy.path=/api
  ```

- **Configuration de Hibernate ORM avec Panache :**
  ```properties
  quarkus.hibernate-orm.database.generation=drop-and-create
  quarkus.hibernate-orm.log.sql=true
  ```

- **Configuration de la sécurité (avec OAuth2) :**
  ```properties
  quarkus.oidc.auth-server-url=https://auth.example.com
  quarkus.oidc.client-id=my-client-id
  quarkus.oidc.credentials.secret=my-secret
  ```
</div>



---

<!-- _class: lead -->
<!-- _paginate: false -->

## Développement de services REST

---

## Développement de services REST

#### Création de services RESTful avec JAX-RS

<div style="font-size:30px">

- JAX-RS (Java API for RESTful Web Services) est une API standardisée pour créer des services web REST en Java.
- **Quarkus** intègre JAX-RS pour faciliter la création de services RESTful. Voici un guide étape par étape pour créer un service RESTful avec JAX-RS dans Quarkus.

</div>

---

## Développement de services REST

#### Création de services RESTful avec JAX-RS

<div style="font-size:23px">

#### **1. Configuration de base**

Avant de commencer à coder, assurez-vous que votre projet est configuré pour utiliser JAX-RS. Lorsque vous créez un projet Quarkus, l'extension RESTEasy (implémentation JAX-RS par défaut dans Quarkus) est généralement incluse par défaut. Si ce n'est pas le cas, vous pouvez l'ajouter via Maven.

##### **Ajout de l'extension RESTEasy :**

Si l'extension RESTEasy n'est pas encore ajoutée, vous pouvez l'ajouter au fichier `pom.xml` :

```xml
<dependency>
    <groupId>io.quarkus</groupId>
    <artifactId>quarkus-resteasy</artifactId>
</dependency>
```


</div>

---

## Développement de services REST

#### Création de services RESTful avec JAX-RS

<div style="font-size:19px">

#### **2. Création d'une ressource REST**

Une ressource REST dans JAX-RS est une classe Java annotée qui expose des méthodes HTTP (GET, POST, PUT, DELETE) pour répondre aux requêtes clients.

##### **Exemple de classe de ressource REST :**

```java
package org.acme;

@Path("/hello")
public class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello, Quarkus!";
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response createGreeting(Greeting greeting) {
        // Logique pour créer une nouvelle ressource
        return Response.ok(greeting).status(201).build();
    }
}
```
</div>


---
## Développement de services REST

#### Création de services RESTful avec JAX-RS

<div style="font-size:23px">

#### **3. Explication des annotations JAX-RS**

- **`@Path("/hello")` :** Spécifie le chemin relatif pour accéder à cette ressource. Par exemple, cette ressource sera accessible via `http://localhost:8080/hello`.

- **`@GET`, `@POST`, `@PUT`, `@DELETE` :** Annotations pour indiquer le type de requête HTTP que la méthode gère. 
  - `@GET` : Utilisé pour lire des informations.
  - `@POST` : Utilisé pour créer de nouvelles ressources.
  - `@PUT` : Utilisé pour mettre à jour des ressources existantes.
  - `@DELETE` : Utilisé pour supprimer des ressources.

</div>

---
## Développement de services REST

#### Création de services RESTful avec JAX-RS

<div style="font-size:23px">

#### **3. Explication des annotations JAX-RS**

- **`@Produces(MediaType.TEXT_PLAIN)` et `@Consumes(MediaType.APPLICATION_JSON)` :**
  - `@Produces` : Indique le type MIME (ou Content-Type) de la réponse. Par exemple, `MediaType.TEXT_PLAIN` signifie que la réponse sera du texte brut.
  - `@Consumes` : Indique le type MIME que la méthode peut accepter dans la requête. `MediaType.APPLICATION_JSON` signifie que la méthode accepte des données au format JSON.

- **`@PathParam` :** Utilisé pour extraire des variables du chemin d'URL. Par exemple, `@PathParam("id") Long id` extrait la valeur de `{id}` de l'URL `http://localhost:8080/hello/{id}`.

</div>

---
## Développement de services REST

#### Création de services RESTful avec JAX-RS

<div style="font-size:23px">

#### **4. Gestion des erreurs et des réponses personnalisées**

Vous pouvez personnaliser les réponses HTTP en utilisant la classe `Response` de JAX-RS, comme montré dans l'exemple précédent. Cela vous permet de définir les codes de statut, les en-têtes, et les corps de réponse.

##### **Exemple de réponse personnalisée :**

```java
@GET
@Path("/greet/{name}")
@Produces(MediaType.TEXT_PLAIN)
public Response greet(@PathParam("name") String name) {
    if (name == null || name.isEmpty()) {
        return Response.status(Response.Status.BAD_REQUEST)
                       .entity("Name parameter is missing")
                       .build();
    }
    return Response.ok("Hello, " + name + "!").build();
}
```

</div>

---
## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:30px">

- **CDI** (Contexts and Dependency Injection) est une spécification Java qui permet la gestion des dépendances de manière flexible et modulaire. 
- **CDI** est intégré dans Quarkus, facilitant l'injection de dépendances et le développement d'applications Java basées sur des composants.

</div>



---

## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:30px">

#### **1. Concepts de Base de CDI**

- **Injection de Dépendances :** Permet de fournir des instances de classes directement aux composants qui en ont besoin, sans que ces composants n'aient à gérer la création ou la gestion de ces instances.
- **Bean :** Une classe gérée par CDI qui peut être injectée dans d'autres composants.
- **Scope (Portée) :** Détermine la durée de vie d'un bean. Les scopes courants incluent `@ApplicationScoped`, `@RequestScoped`, et `@Singleton`.

</div>

---

## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:20px">

#### **2. Configuration CDI dans Quarkus**

Quarkus utilise CDI par défaut, il n'y a donc généralement aucune configuration supplémentaire requise pour commencer à utiliser l'injection de dépendances.

##### **Exemple de Classe avec CDI :**

Voici un exemple simple montrant comment créer une classe service et l'injecter dans une ressource REST.

1. **Création d'une Classe de Service (Bean CDI) :**

```java
package org.acme;

import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class GreetingService {

    public String greet(String name) {
        return "Hello, " + name;
    }
}
```

</div>

---

## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:20px">

#### **2. Configuration CDI dans Quarkus**

2. **Injection de la Dépendance dans une Ressource REST :**

```java
package org.acme;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/greet")
public class GreetingResource {

    @Inject
    GreetingService greetingService;

    @GET
    @Path("/{name}")
    @Produces(MediaType.TEXT_PLAIN)
    public String greet(String name) {
        return greetingService.greet(name);
    }
}
```


</div>

---

## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:20px">

#### **3. Scopes CDI**
Les scopes déterminent la durée de vie et la portée des beans CDI. Voici quelques scopes couramment utilisés :

- **`@ApplicationScoped` :**
  - La portée est sur l'ensemble de l'application.
  - Un bean `@ApplicationScoped` est partagé entre tous les utilisateurs et toutes les sessions.

- **`@RequestScoped` :**
  - La portée est limitée à une seule requête HTTP.
  - Un bean `@RequestScoped` est créé au début d'une requête et détruit à la fin de celle-ci.

- **`@Singleton` :**
  - Un bean `@Singleton` est similaire à `@ApplicationScoped`, mais il est géré par la JVM elle-même et est également accessible en dehors du contexte CDI.

- **`@SessionScoped` :**
  - Utilisé pour maintenir un état spécifique à la session d'un utilisateur dans des applications web.

</div>

---

## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:30px">

#### **3. Scopes CDI**
##### **Exemple avec `@RequestScoped` :**

```java
package org.acme;

import javax.enterprise.context.RequestScoped;

@RequestScoped
public class RequestScopedService {

    public String processRequest() {
        return "Processed request at " + System.currentTimeMillis();
    }
}
```

</div>

---

## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:19px">

#### **4. Producteurs et Qualifieurs**

**Producteurs :** CDI permet également de créer des beans de manière plus flexible en utilisant des producteurs. Un producteur est une méthode annotée avec `@Produces` qui fournit des objets CDI.

##### **Exemple de Producteur :**

```java
package org.acme;

import javax.enterprise.inject.Produces;
import javax.inject.Named;

public class GreetingProducer {

    @Produces
    @Named("customGreeting")
    public String customGreeting() {
        return "Hello from a producer!";
    }
}
```

</div>

---
## Développement de services REST

#### Injection de dépendances avec CDI (Contexts and Dependency Injection)

<div style="font-size:19px">

#### **4. Producteurs et Qualifieurs**

**Qualifieurs :** Les qualifieurs permettent de différencier les implémentations de beans injectables. Ils sont utiles lorsque vous avez plusieurs implémentations d'une même interface.

##### **Exemple de Qualifieur :**

```java
package org.acme;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import javax.inject.Qualifier;
import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

@Qualifier
@Retention(RUNTIME)
@Target({FIELD, TYPE, METHOD})
public @interface SpecialGreeting {
}
```


</div>

---

## Développement de services REST

#### Gestion des formats de données avec JSON-B et JSON-P.

<div style="font-size:30px">

- Quarkus fournit un support intégré pour travailler avec des données JSON via JSON-B (JSON Binding) et JSON-P (JSON Processing). 
- Ces API permettent respectivement de sérialiser/désérialiser des objets Java en JSON et de manipuler des données JSON de manière flexible.

</div>

---

## Développement de services REST

#### Gestion des formats de données avec JSON-B et JSON-P.

<div style="font-size:18px">

#### **1. JSON-B (JSON Binding)**

JSON-B est une spécification qui permet de convertir automatiquement des objets Java en JSON et inversement, de manière similaire à JAXB pour XML.

##### **Utilisation de JSON-B avec Quarkus :**

Quarkus intègre JSON-B par défaut lorsque vous utilisez JAX-RS pour créer des services RESTful. 

1. **Création d'une Entité Java :**

```java
package org.acme;

public class Person {

    private String name;
    private int age;

    public Person() {}

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

}
```

</div>

---

## Développement de services REST

#### Gestion des formats de données avec JSON-B et JSON-P.

<div style="font-size:18px">

#### **1. JSON-B (JSON Binding)**

JSON-B est une spécification qui permet de convertir automatiquement des objets Java en JSON et inversement, de manière similaire à JAXB pour XML.

##### **Utilisation de JSON-B avec Quarkus :**

2. **Exposition d'un Service REST qui Utilise JSON-B :**

```java
@Path("/person")
public class PersonResource {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Person getPerson() {
        return new Person("John Doe", 30);
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Person createPerson(Person person) {
        // Logique pour traiter l'objet reçu
        return person;
    }
}
```

</div>


---
## Développement de services REST

#### Gestion des formats de données avec JSON-B et JSON-P.

<div style="font-size:30px">

2. **Exposition d'un Service REST qui Utilise JSON-B :**

- **Sérialisation :** La méthode `getPerson` renvoie un objet `Person`, qui est automatiquement converti en JSON par JSON-B.
- **Désérialisation :** La méthode `createPerson` accepte un objet JSON et le désérialise en un objet `Person`.

</div>




---

## Développement de services REST

#### Gestion des formats de données avec JSON-B et JSON-P.

<div style="font-size:19px">

3. **Personnalisation de JSON-B :**

Vous pouvez personnaliser la sérialisation/désérialisation avec des annotations JSON-B, par exemple :

```java
package org.acme;

import javax.json.bind.annotation.JsonbProperty;
import javax.json.bind.annotation.JsonbTransient;

public class Person {

    @JsonbProperty("full_name")
    private String name;
    
    @JsonbTransient
    private int age;
}
```

- **`@JsonbProperty("full_name")` :** Renomme le champ `name` en `full_name` dans le JSON.
- **`@JsonbTransient` :** Exclut le champ `age` de la sérialisation JSON.

</div>

---


<!-- _class: lead -->
<!-- _paginate: false -->

## Interaction avec des bases de données

---

## Interaction avec des bases de données
#### JPA/Hibernate

<br>

<div style="font-size:30px">

- Java Persistence API (JPA) est une spécification standardisée pour la gestion de la persistance des données en Java, tandis que Hibernate est l'une des implémentations les plus populaires de JPA. 
- Quarkus, en tant que framework moderne, intègre parfaitement JPA avec Hibernate pour offrir une solution légère, performante et facile à utiliser pour la persistance des données dans des applications Java.


</div>




---


## Interaction avec des bases de données
#### Introduction à JPA et Hibernate 

<br>

<div style="font-size:23px">

#### 1.1. JPA (Java Persistence API)
JPA est une API Java standard pour la gestion des données relationnelles dans les applications Java. Elle fournit une abstraction pour mapper les objets Java aux tables de bases de données relationnelles (ORM - Object-Relational Mapping). JPA définit un ensemble d'annotations et d'interfaces pour interagir avec la base de données, gérer les transactions, et exécuter des requêtes.

#### 1.2. Hibernate
Hibernate est une implémentation open-source de JPA qui offre des fonctionnalités supplémentaires comme le cache de second niveau, la gestion avancée des relations, et l'optimisation des performances. Hibernate est largement utilisé dans l'écosystème Java pour sa robustesse et sa flexibilité.


</div>


---



## Interaction avec des bases de données
#### Introduction à JPA et Hibernate 


<div style="font-size:24px">

### 2. Configuration de JPA/Hibernate avec Quarkus

#### 2.1. Ajouter les extensions nécessaires

Pour commencer avec JPA et Hibernate dans Quarkus, vous devez ajouter les extensions appropriées :

```bash
./mvnw quarkus:add-extension -Dextensions="hibernate-orm, jdbc-postgresql"
```

- **`hibernate-orm`** : Inclut JPA avec l'implémentation Hibernate.
- **`jdbc-postgresql`** : JDBC driver pour PostgreSQL (remplacez-le par le pilote de la base de données que vous utilisez, comme MySQL ou H2).


</div>


---
## Interaction avec des bases de données
#### Introduction à JPA et Hibernate 

<div style="font-size:18px">

### 2. Configuration de JPA/Hibernate avec Quarkus

#### 2.2. Configurer la connexion à la base de données

Ajoutez les propriétés suivantes dans votre fichier `application.properties` pour configurer la connexion à la base de données :

```properties
# Configuration de la source de données
quarkus.datasource.db-kind=postgresql
quarkus.datasource.username=your_username
quarkus.datasource.password=your_password
quarkus.datasource.jdbc.url=jdbc:postgresql://localhost:5432/your_database

# Configuration de Hibernate ORM
quarkus.hibernate-orm.database.generation=update
quarkus.hibernate-orm.log.sql=true
```
- **`quarkus.datasource.db-kind`** : Type de base de données (par exemple, `postgresql`, `mysql`, `h2`).
- **`quarkus.datasource.jdbc.url`** : URL de connexion JDBC.
- **`quarkus.hibernate-orm.database.generation`** : Définit comment Quarkus doit gérer les schémas de la base de données (`update`, `validate`, `drop-and-create`, etc.).
- **`quarkus.hibernate-orm.log.sql`** : Permet de journaliser les requêtes SQL exécutées par Hibernate.

</div>



---

## Interaction avec des bases de données
#### Utilisation des repositories et du Panache 

<div style="font-size:25px">

<br>

- Panache est une bibliothèque fournie par Quarkus qui simplifie la gestion des entités et des opérations de base de données dans les applications Java. 
- Panache réduit le besoin de code répétitif (boilerplate) en fournissant des méthodes prêtes à l'emploi pour effectuer des opérations courantes comme la création, la lecture, la mise à jour et la suppression (CRUD) sur les entités. 
- Panache peut être utilisé de deux manières principales : avec des entités actives (qui héritent de `PanacheEntity`) ou avec des repositories (qui implémentent `PanacheRepository`).

</div>



---

## Interaction avec des bases de données
#### Utilisation des repositories et du Panache 

<div style="font-size:19px">

### 1. Utilisation des Entités avec Panache

#### 1.1. Création d'une Entité avec Panache

Lorsque vous utilisez Panache, une entité peut hériter de `PanacheEntity`. Cela rend les champs `id` et les méthodes CRUD de base disponibles directement sur l'entité.

```java
import io.quarkus.hibernate.orm.panache.PanacheEntity;
import javax.persistence.Entity;

@Entity
public class User extends PanacheEntity {

    public String username;
    public String email;
    public String password;
}
```

Dans cet exemple :
- **`PanacheEntity`** : Rend la gestion de l'entité plus simple en fournissant un `id` généré automatiquement et des méthodes CRUD de base.

</div>

---

## Interaction avec des bases de données
#### Utilisation des repositories et du Panache 

<div style="font-size:19px">

### 1. Utilisation des Entités avec Panache

#### 1.2. Opérations CRUD avec PanacheEntity

Avec une entité Panache, vous pouvez effectuer des opérations CRUD directement :

```java
// Créer un utilisateur
User user = new User();
user.username = "john_doe";
user.email = "john.doe@example.com";
user.password = "password123";
user.persist(); // Sauvegarde l'utilisateur dans la base de données

// Lire un utilisateur par ID
User user = User.findById(1L);

// Mettre à jour un utilisateur
user.username = "john_doe_updated";
user.persist();

// Supprimer un utilisateur
user.delete();
```

</div>

---

## Interaction avec des bases de données
#### Utilisation des repositories et du Panache 

<div style="font-size:22px">

### 1. Utilisation des Entités avec Panache

#### 1.3. Requêtes Simplifiées

Panache offre également des méthodes pour exécuter des requêtes simplifiées :

```java
// Trouver tous les utilisateurs
List<User> users = User.listAll();

// Trouver des utilisateurs par champ
User user = User.find("username", "john_doe").firstResult();

// Trouver avec plusieurs paramètres
List<User> users = User.find("email like ?1", "%@example.com").list();
```

</div>

---

## Interaction avec des bases de données
#### Utilisation des repositories et du Panache 

<div style="font-size:19px">

### 2. Utilisation des Repositories avec Panache

Si vous préférez utiliser un modèle plus orienté repository (ou DAO), Panache offre une autre approche via `PanacheRepository`. Cette approche permet de mieux séparer la logique métier et la gestion des données.

#### 2.1. Création d'un Repository

Vous pouvez créer un repository en implémentant l'interface `PanacheRepository` ou `PanacheRepositoryBase` (si vous avez un type d'identifiant différent de `Long`).

```java
import io.quarkus.hibernate.orm.panache.PanacheRepository;
import javax.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class UserRepository implements PanacheRepository<User> {

    // Méthode personnalisée pour trouver un utilisateur par nom d'utilisateur
    public User findByUsername(String username) {
        return find("username", username).firstResult();
    }
}
```


</div>

---
## Interaction avec des bases de données
#### Utilisation des repositories et du Panache 

<div style="font-size:16px">

### 2. Utilisation des Repositories avec Panache

#### 2.2. Utilisation du Repository

```java
import javax.inject.Inject;
import javax.transaction.Transactional;

public class UserService {

    @Inject
    UserRepository userRepository;

    @Transactional
    public void createUser(String username, String email, String password) {
        User user = new User();
        user.username = username;
        user.email = email;
        user.password = password;
        userRepository.persist(user);
    }

    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
  
}
```

</div>
