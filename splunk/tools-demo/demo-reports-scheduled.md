index=main sourcetype="eventgen" 
| eval callPrice=duration*price
| stats sum(callPrice) as "Total Call Price" by partner
| sort -"Total Call Price"