#!/bin/bash
#script de feeds de EAN

tempDirectory="/data/ean/hotels/tempDirectory"
eanHotelsInput="/data/ean/hotels"
scriptDir="/scripts"

urls=("https://www.ian.com/affiliatecenter/include/V2/ActivePropertyList.zip" "https://www.ian.com/affiliatecenter/include/V2/PropertyDescriptionList_es_ES.zip" "https://www.ian.com/affiliatecenter/include/V2/HotelImageList.zip" "https://www.ian.com/affiliatecenter/include/V2/AttributeList_es_ES.zip" "https://www.ian.com/affiliatecenter/include/V2/PropertyAttributeLink_es_ES.zip" "https://www.ian.com/affiliatecenter/include/V2/RoomTypeList_es_ES.zip" "https://www.ian.com/affiliatecenter/include/V2/RoomTypeList.zip" "https://www.ian.com/affiliatecenter/include/V2/PolicyDescriptionList_es_ES.zip" "https://www.ian.com/affiliatecenter/include/V2/PropertyFeesList_es_ES.zip" "https://www.ian.com/affiliatecenter/include/V2/PropertyMandatoryFeesList_es_ES.zip")
nombres=("ActivePropertyList" "PropertyDescriptionList_es_ES" "HotelImageList" "AttributeList_es_ES" "PropertyAttributeLink_es_ES" "RoomTypeList_es_ES" "RoomTypeList" "PolicyDescriptionList_es_ES" "PropertyFeesList_es_ES" "PropertyMandatoryFeesList_es_ES")
metaUrl="http://jboss:8080/feed-downloader/inactivateEANHotels"

start=$SECONDS
echo [`date`] "Avisando a Slack"
$scriptDir/slack-alert.sh "START >> *eanHotels.sh*"

echo [`date`] "Creando carpeta temporal"
mkdir -p $tempDirectory
cd $tempDirectory
index=0
echo [`date`] "Desactivando EAN hotels en base de datos"
curl $metaUrl
for url in "${urls[@]}"
do
	echo [`date`] "Bajando archivo ${nombres[index]}.zip"
	echo [`date`] "url: $url"
	curl --retry 5 -O $url
	echo [`date`] "Descomprimiendo archivo ${nombres[index]}.zip"
	unzip ${nombres[index]}.zip 
	echo [`date`] "Spliteando y moviendo archivos a $eanHotelsInput"
	
	tail -n +2 ${nombres[index]}.txt | split -d -a 4 - $eanHotelsInput/${nombres[index]}
	
	$scriptDir/slack-alert.sh "*eanHotels.sh* >> Fin de ${nombres[index]}"
	((index++))	
done
echo [`date`] "Borrando archivos temporales"
rm *.*

echo [`date`] "Avisando a Slack"
$scriptDir/slack-alert.sh "END >> *eanHotels.sh* en $(( SECONDS - start )) seg"
