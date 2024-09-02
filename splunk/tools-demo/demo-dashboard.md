Il faudra créer 3 panneaux : 

Le nom du dashboard -> Technology_Dashboard_HourlyCallindicators

1 - Premier panneau : index=main sourcetype="eventgen" | top deviceMAC, userIPAddress,callerNumber sur les 60 dernières minutes.

# Rechercher les événements dans l'index "main" avec le sourcetype "eventgen"
index=main sourcetype="eventgen"

# Utiliser la commande "top" pour trouver les combinaisons les plus fréquentes des champs "deviceMAC", "userIPAddress", et "callerNumber"
| top deviceMAC, userIPAddress, callerNumber

Enregister sous nouveau tableau de bord -> Le nom du dashboard -> Technology_Dashboard_HourlyCallindicators


2 - Second panneau : index=main sourcetype="eventgen"| timechart count by nodeName limit=10 sur les 60 dernières minutes

# Rechercher les événements dans l'index "main" avec le sourcetype "eventgen"
index=main sourcetype="eventgen"

# Utiliser la commande "timechart" pour créer un graphique temporel du nombre d'événements
# Groupés par le champ "nodeName"
# Limiter l'affichage aux 10 valeurs les plus fréquentes de "nodeName"
| timechart count by nodeName limit=10

Rajouter ce panneau dans un dashboard existant => Total Call By Host


3 - Troisième panneau : index=main sourcetype="eventgen" callResult=Failure | stats count as "Total Network Failures" -> Le titre : Total Network Failures

# Rechercher les événements dans l'index "main" avec le sourcetype "eventgen"
# Filtrer pour inclure uniquement les événements où le champ "callResult" est égal à "Failure"
index=main sourcetype="eventgen" callResult=Failure

# Utiliser la commande "stats" pour compter le nombre total d'événements filtrés
# Renommer le résultat du comptage en "Total Network Failures"
| stats count as "Total Network Failures"

Rajouter ce panneau : Le titre : Total Network Failures


4 - Quatrième panneau : Modifier -> Rajouter un panneau et aller le chercher dans la rapport.


5 - 