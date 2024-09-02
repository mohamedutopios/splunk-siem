### **Collecte de Logs dans un SIEM**

La collecte de logs est une fonction centrale d'un SIEM (Security Information and Event Management), permettant de centraliser les informations provenant de diverses sources de sécurité pour une analyse, une corrélation et une détection des menaces efficaces. Voici un aperçu des principaux aspects de la collecte de logs, notamment les sources de données typiques et les méthodes utilisées pour collecter ces données.

### **1. Sources de Données Typiques**

#### **a. Pare-feu (Firewalls)**
   - **Rôle :** Les pare-feu surveillent et contrôlent le trafic réseau entrant et sortant basé sur des règles de sécurité prédéfinies.
   - **Types de Logs :**
     - **Logs de Connexion :** Informations sur les tentatives de connexion entrantes et sortantes, y compris les adresses IP source et destination, les ports utilisés, et les protocoles.
     - **Logs de Rejet/Bloquage :** Détails des connexions rejetées ou bloquées en fonction des règles de sécurité.
     - **Logs de Configurations :** Changements dans les règles de pare-feu et autres paramètres de configuration.

#### **b. IDS/IPS (Intrusion Detection Systems/Intrusion Prevention Systems)**
   - **Rôle :** Les IDS/IPS surveillent les activités réseau pour détecter et/ou prévenir les intrusions et les activités malveillantes.
   - **Types de Logs :**
     - **Logs d'Alarme :** Détection d'activités suspectes ou malveillantes, telles que des tentatives d'exploitation de vulnérabilités ou des scans de ports.
     - **Logs d'Action :** Actions prises pour bloquer ou prévenir une intrusion, comme la fermeture d'une connexion ou l'activation d'une alerte.
     - **Logs de Signatures :** Informations sur les signatures de menaces spécifiques utilisées pour détecter des activités malveillantes.

#### **c. Antivirus**
   - **Rôle :** Les logiciels antivirus détectent et neutralisent les logiciels malveillants (malware) sur les systèmes d'exploitation et les dispositifs connectés.
   - **Types de Logs :**
     - **Logs de Détection :** Informations sur les fichiers ou processus malveillants détectés, incluant les noms des menaces, les emplacements, et les actions entreprises (quarantaine, suppression).
     - **Logs de Scans :** Résultats des scans de sécurité planifiés ou déclenchés manuellement, indiquant les fichiers vérifiés et les menaces détectées.
     - **Logs de Mise à Jour :** Informations sur les mises à jour des définitions de virus et du logiciel antivirus lui-même.

#### **d. Serveurs (Windows, Linux, Unix)**
   - **Rôle :** Les serveurs exécutent des applications critiques et stockent des données essentielles, et leurs logs fournissent des informations détaillées sur les opérations et la sécurité du système.
   - **Types de Logs :**
     - **Logs de Sécurité :** Tentatives de connexion (réussies ou échouées), modifications des permissions d'accès, et autres événements liés à la sécurité.
     - **Logs Système :** Événements liés à l'état du système, tels que les démarrages, les arrêts, les erreurs matérielles ou logicielles.
     - **Logs d'Applications :** Informations sur le fonctionnement des applications hébergées sur le serveur, incluant les erreurs, les accès, et les performances.

#### **e. Applications et Bases de Données**
   - **Rôle :** Les applications et les bases de données stockent et traitent des informations cruciales pour l'organisation, et leurs logs fournissent des insights sur les accès aux données et les opérations internes.
   - **Types de Logs :**
     - **Logs d'Accès :** Qui a accédé à quelles données, à quel moment, et depuis quelle source.
     - **Logs d'Erreur :** Détails des erreurs survenues dans les applications ou les bases de données.
     - **Logs de Transaction :** Informations sur les transactions exécutées, comme les insertions, suppressions, ou modifications de données.

### **2. Agents de Collecte et Protocoles**

#### **a. Agents de Collecte**
   - **Description :** Les agents sont des logiciels installés sur les systèmes sources (comme les serveurs, les pare-feu, ou les endpoints) pour collecter les logs et les transmettre au SIEM. Ils peuvent également effectuer des tâches supplémentaires, comme le filtrage ou la pré-analyse des données avant leur envoi.
   - **Exemples d'Agents :**
     - **Splunk Forwarder :** Utilisé pour collecter et transmettre les logs à un serveur Splunk central.
     - **NXLog :** Un agent open-source capable de collecter, traiter et transférer des logs de divers formats.
     - **Sysmon :** Outil de Microsoft pour surveiller et collecter des événements Windows, souvent utilisé pour la collecte de logs de sécurité détaillés.

#### **b. Protocoles de Collecte**
   - **Syslog**
     - **Description :** Syslog est un protocole standard pour la transmission de messages de log. Il est largement utilisé par les systèmes Unix/Linux, les dispositifs réseau, et même certains systèmes Windows.
     - **Fonctionnement :** Les messages de log sont envoyés depuis la source (comme un pare-feu ou un serveur Linux) vers un collecteur Syslog via les ports UDP 514 ou TCP 514. Le SIEM collecte ensuite ces messages pour analyse.
     - **Avantages :** Simplicité, support généralisé, et capacité à centraliser facilement les logs.

   - **SNMP (Simple Network Management Protocol)**
     - **Description :** SNMP est un protocole utilisé principalement pour la gestion et la surveillance des dispositifs réseau.
     - **Fonctionnement :** Les dispositifs envoient des messages SNMP ("traps") à un gestionnaire SNMP pour signaler des événements comme des erreurs ou des pannes. Ces messages peuvent ensuite être intégrés dans le SIEM pour une analyse plus approfondie.
     - **Avantages :** Efficace pour la surveillance réseau en temps réel et largement supporté par les équipements réseau.

   - **WMI (Windows Management Instrumentation)**
     - **Description :** WMI est une technologie de Microsoft qui permet la gestion des systèmes et l'obtention de données sur les systèmes Windows.
     - **Fonctionnement :** WMI peut être utilisé pour collecter des informations système, des événements de sécurité, et d'autres types de logs depuis les systèmes Windows. Ces données sont ensuite transmises au SIEM pour analyse.
     - **Avantages :** Intégration profonde avec l'écosystème Windows, permettant une collecte granulaire des événements.

#### **c. Méthodes de Transmission**
   - **Collecte Active :** L'agent ou le SIEM interroge régulièrement les sources pour collecter les nouveaux logs.
   - **Collecte Passive :** Les sources envoient automatiquement les logs au SIEM ou à un collecteur intermédiaire dès qu'ils sont générés.
   - **Transfert Sécurisé :** Les logs sont souvent chiffrés avant d'être envoyés au SIEM pour garantir la confidentialité et l'intégrité des données en transit.

### **Conclusion**

La collecte efficace des logs à partir de diverses sources de données est essentielle pour permettre au SIEM de détecter les menaces, d'analyser les incidents de sécurité, et de faciliter la conformité réglementaire. Grâce à l'utilisation d'agents de collecte et de protocoles standard comme Syslog, SNMP, et WMI, le SIEM peut centraliser et corréler les informations de sécurité de manière cohérente, offrant ainsi une vue complète et en temps réel de l'état de sécurité de l'infrastructure informatique.