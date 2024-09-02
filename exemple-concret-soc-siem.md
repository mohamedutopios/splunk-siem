### **Exemple Concret : Détection et Réponse à une Tentative de Compromission par Phishing dans un SOC**

#### **Contexte**
Une grande entreprise financière utilise un SOC pour surveiller ses systèmes critiques et détecter les menaces en temps réel. Le SOC est équipé d'un SIEM capable de collecter des logs provenant de diverses sources, dont les serveurs de messagerie, les pare-feu, les systèmes d'exploitation, et les outils de sécurité comme les antivirus et les solutions de détection des menaces.

#### **Scénario**
Un employé de l'entreprise reçoit un email de phishing sophistiqué qui imite une communication interne. L'email contient un lien vers un site malveillant conçu pour voler les informations d'identification de l'utilisateur.

#### **Étape 1 : Collecte des Logs**
- **Serveur de Messagerie :** Le SIEM collecte les logs des serveurs de messagerie montrant l'arrivée de l'email, son expéditeur, et son contenu.
- **Proxy Web/Firewall :** Les logs des pare-feu et des proxys web montrent que l'utilisateur a cliqué sur le lien contenu dans l'email et a tenté d'accéder au site malveillant.
- **Systèmes d'Exploitation :** Les logs des postes de travail montrent que l'utilisateur a tenté de se connecter au site web, et l'authentification Windows échoue ou présente des anomalies.
- **Antivirus :** Le SIEM reçoit des alertes des logiciels antivirus indiquant une tentative d'exécution de code malveillant après la visite du site.

#### **Étape 2 : Corrélation des Événements**
- Le SIEM corrèle les événements de différents systèmes :
  - Il identifie que l'email est suspect en se basant sur les données de threat intelligence intégrées dans le SIEM.
  - Il associe l'ouverture de l'email à la tentative de connexion au site malveillant.
  - Il détecte des comportements anormaux (comme une tentative d'exfiltration de données ou l'exécution de code non autorisé) peu de temps après l'accès au site.

#### **Étape 3 : Génération d'Alerte et Notification**
- Le SIEM génère une alerte critique automatiquement, car il détecte une séquence d'événements typique d'une tentative de phishing :
  - Un email suspect.
  - Une tentative d'accès à un site web malveillant.
  - Une activité anormale sur le poste de travail de l'utilisateur.
- Cette alerte est envoyée immédiatement aux analystes de sécurité du SOC.

#### **Étape 4 : Investigation et Réponse**
- **Analyse de l'Incident :**
  - Les analystes SOC analysent l'alerte. En utilisant les fonctionnalités d'investigation du SIEM, ils peuvent rapidement accéder aux logs détaillés pour comprendre ce qui s'est passé.
  - Ils vérifient si d'autres utilisateurs ont reçu le même email et si des activités similaires ont été observées.
  - Ils examinent les logs du proxy web et du pare-feu pour voir si l'attaque a réussi à pénétrer plus loin dans le réseau.

- **Réponse Immédiate :**
  - Le SOC isole le poste de travail de l'utilisateur compromis pour empêcher toute propagation potentielle de la menace.
  - Ils bloquent l'accès au site malveillant à l'échelle du réseau en mettant à jour les règles du pare-feu et du proxy.
  - Le SIEM déclenche une action automatisée (via SOAR intégré) pour réinitialiser les mots de passe de l'utilisateur concerné.

- **Communication et Documentation :**
  - Le SOC informe l'équipe informatique et la direction de l'incident en cours et des mesures prises.
  - L'incident est documenté dans le SIEM avec toutes les preuves, y compris les logs, les analyses, et les actions entreprises.

#### **Étape 5 : Post-Incident**
- **Analyse Forensique :**
  - Une analyse approfondie est menée pour déterminer si l'attaquant a réussi à accéder à des informations sensibles ou à installer des logiciels malveillants supplémentaires.
  - Les résultats de cette analyse aident à comprendre la méthode d'attaque et à renforcer les défenses.

- **Amélioration Continue :**
  - Le SOC met à jour les règles de corrélation du SIEM pour détecter plus rapidement des tentatives similaires à l'avenir.
  - Une formation de sensibilisation à la sécurité est proposée aux employés pour les aider à reconnaître les emails de phishing.
  - Un rapport est généré par le SIEM pour les audits de conformité, montrant comment l'incident a été géré et quelles améliorations ont été mises en place.

### **Résumé**

Dans cet exemple, le SOC a utilisé le SIEM pour détecter une tentative de phishing avant qu'elle ne cause des dommages importants. Grâce à la collecte et à l'agrégation des logs provenant de multiples sources, le SIEM a pu corréler les événements, générer une alerte critique, et permettre une réponse rapide et coordonnée. Cet incident montre l'importance d'une surveillance continue et d'une gestion proactive des incidents dans la protection des actifs numériques d'une organisation.
