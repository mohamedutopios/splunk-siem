
#### Requête pour Identifier les Adresses IP avec le Plus d'Échecs : 

source="auth.log" host="auth" index="auth" sourcetype="linux_secure"
| rex field=_raw "from (?<src_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"
| search "Failed password"
| stats count by src_ip
| sort -count
| rename count as "Failed Attempts"
| head 10

#### Requête pour Compter les Tentatives de Connexion Réussies et Échouées

source="auth.log" host="auth" index="auth" sourcetype="linux_secure"
| eval status=if(match(_raw, "Failed password"), "Failed", "Success")
| stats count as total_attempts, sum(eval(status="Failed")) as failed_attempts, sum(eval(status="Success")) as success_attempts
| eval failure_percentage=round((failed_attempts/total_attempts)*100, 2)
| eval success_percentage=round((success_attempts/total_attempts)*100, 2)
| table total_attempts failed_attempts success_attempts failure_percentage success_percentage


#### Requête Splunk pour Calculer le Ratio des Échecs de Connexion de root par Rapport à l'Ensemble des Connexions

source="auth.log" host="auth" index="auth" sourcetype="linux_secure"
| eval status=if(searchmatch("Failed password for root"), "Failed", "Success")
| stats count as Total by status
| eventstats sum(Total) as TotalConnections
| eval PercentageFailed = round((Total/TotalConnections)*100, 2)
| table status Total PercentageFailed

#### compter le nombre d'adresses IP distinctes qui utilisent l'utilisateur root
source="auth.log" host="auth" index="auth" sourcetype="linux_secure"
| search "Failed password for root"
| rex field=_raw "from (?<src_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"
| stats dc(src_ip) as distinct_ip_count