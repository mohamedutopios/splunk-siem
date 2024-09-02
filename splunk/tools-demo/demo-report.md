
- Creéation d'un rapport : index=main sourcetype="eventgen" callResult=Failure | top  partner


- Modification du rapport : index=main sourcetype="eventgen" callResult=Failure | top countfield="Total Failures" partner | rename percent as "Percentage of failures"

