# Mejoramos la prioridad de todas las Regiones con id < a 20K ya que son las ciudades mas importantes del mundo. 
update feeds.Region set searchPriority=70, modifiedByUser='root', modifiedTimestamp=sysDate() 
where id < 20000 and regionType = 'CITY' and subClass is null;

# Mejoramos la prioridad de todas las Regiones mas populares para Cocha.
update feeds.Region set searchPriority=0, modifiedByUser='root', modifiedTimestamp=sysDate()
where id in ('2902','935','2998','2297','601751','6024028','1639','2265','6131807','2114','716','2077','2693','2621','129440');
#Punta Cana(2902), Cancún(935), Río de Janeiro(2998), Miami(2297), Playa del Carmen(601751), San Andrés(6024028), 
#Estambúl(1639), Ciudad de México(2265), Bayahibe(6131807), Londres(2114), Buenos Aires(716), Lima(2077), Orlando(2693),
#New York(2621), Manhattan(129440)

# Mejoramos la prioridad de todos los aeropuertos para que siempre aparezcan en los resultados.
update feeds.Region set searchPriority=10, modifiedByUser='root', modifiedTimestamp=sysDate() 
where regionType = 'AIRPORT';