
index=main sourcetype="eventgen" | stats count(failureCode) as "Total Failures" by nodeName, partner


index=main sourcetype="eventgen" | stats distinct_count(zipCode) as "Number of Zip Codes"


index=main sourcetype="eventgen" responseCode=200 
| stats avg(duration) as AvgCallTime by partner
| eval AvgCallTime=round(AvgCallTime,2)
| eval "Avg Duration by Partner"=tostring(AvgCallTime, "duration")

index=main sourcetype="eventgen" responseCode=200 
| stats avg(duration) as AvgCallTime by partner
| eval AvgCallTime=round(AvgCallTime,2)
| eval "Avg Duration by Partner"=tostring(AvgCallTime, "duration")


index=main sourcetype="eventgen" 
| stats list(responseCode) as "Response Codes"

index=main sourcetype="eventgen" 
| stats values(responseCode) as "Response Codes"


index=main sourcetype="eventgen" 
| stats count as "Total events", count(zipCode) as "Total Events ZipCode", dc(zipCode) as "Number of Zip Codes", sum(duration) as TotalCallTime, avg(duration) as AvgCallTime by partner 
| eval TotalCallTime=tostring(round(TotalCallTime),"duration"), AvgCallTime=round(AvgCallTime,2)


index=main sourcetype="eventgen" 
| top responseCode

# Rechercher les événements dans l'index "main" avec le sourcetype "eventgen"
index=main sourcetype="eventgen" 

# Utiliser la commande "top" pour trouver les valeurs les plus fréquentes du champ "responseCode"
# Désactiver l'affichage des pourcentages avec "showperc=f"
# Renommer le champ de comptage en "Count by Response Code"
| top showperc=f countfield="Count by Response Code" responseCode

index=main sourcetype="eventgen" 
| top limit=0 responseCode


index=main sourcetype="eventgen" 
| top failureCode by partner

index=main sourcetype="eventgen" 
| top limit=3 failureCode by partner

index=main sourcetype="eventgen" 
| top limit=0 failureCode by partner, nodeName


# Rechercher les événements dans l'index "main" avec le sourcetype "eventgen"
index=main sourcetype="eventgen"

# Utiliser la commande "rare" pour trouver les valeurs les moins fréquentes du champ "responseCode"
# Limiter le résultat aux 3 valeurs les moins fréquentes
| rare limit=3 responseCode
