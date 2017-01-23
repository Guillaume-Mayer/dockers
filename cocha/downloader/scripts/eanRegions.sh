#!/bin/bash
#script de feeds de EAN para modelo de locations

tempDirectory="/data/ean/geo/tempDirectory"
eanGeoInput="/data/ean/geo"

urls=("https://www.ian.com/affiliatecenter/include/V2/CityCoordinatesList.zip" "https://www.ian.com/affiliatecenter/include/V2/AirportCoordinatesList.zip" "https://www.ian.com/affiliatecenter/include/V2/ParentRegionList.zip" "https://www.ian.com/affiliatecenter/include/V2/NeighborhoodCoordinatesList.zip" "https://www.ian.com/affiliatecenter/include/V2/PointsOfInterestCoordinatesList.zip" "https://www.ian.com/affiliatecenter/include/V2/RegionEANHotelIDMapping.zip" "https://www.ian.com/affiliatecenter/include/V2/RegionList_es_ES.zip" "https://www.ian.com/affiliatecenter/include/V2/CountryList.zip" "https://www.ian.com/affiliatecenter/include/V2/RegionCenterCoordinatesList.zip")
nombres=("CityCoordinatesList" "AirportCoordinatesList" "ParentRegionList" "NeighborhoodCoordinatesList" "PointsOfInterestCoordinatesList" "RegionEANHotelIDMapping" "RegionList_es_ES" "CountryList" "RegionCenterCoordinatesList")

start=$SECONDS
echo [`date`] "Avisando a Slack"
./slack-alert.sh "START >> *eanRegions.sh*"

echo [`date`] "Creando carpeta temporal"
mkdir -p $tempDirectory
cd $tempDirectory
index=0
for url in "${urls[@]}"
do
	echo [`date`] "Bajando archivo ${nombres[index]}.zip"
	echo [`date`] "url: $url"
	curl --retry 5 -O $url
	echo [`date`] "Descomprimiendo archivo ${nombres[index]}.zip"
	unzip ${nombres[index]}.zip 
	echo [`date`] "Spliteando y moviendo archivos a $eanGeoInput"
	
	tail -n +2 ${nombres[index]}.txt | split -d -a 4 - $eanGeoInput/${nombres[index]}
	./slack-alert.sh "*eanRegions.sh* >> Fin de ${nombres[index]}"
	((index++))
done
echo [`date`] "Borrando archivos temporales"
rm *.*

echo [`date`] "Avisando a Slack"
./slack-alert.sh "END >> *eanRegions.sh* en $(( SECONDS - start )) seg"
