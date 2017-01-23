#!/bin/bash
#script de feeds de BKG

start=$SECONDS
echo [`date`] "Avisando a Slack"
./slack-alert.sh "START >> *bkgHotelsLastChanged.sh*"

currentDirectory=$(pwd)

if [ "$1" == "useLastChange" ];
then
	useLastChange=true
else
	useLastChange=false
fi

tempDirectory="/data/booking/hotels/tempDirectory"
eanHotelsInput="/data/booking/hotels"
lastChangeFile="/data/booking/hotelLastChange.txt"

urls=("https://distribution-xml.booking.com/xml/bookings.getHotels?rows=1000&offset=" "https://distribution-xml.booking.com/xml/bookings.getHotelDescriptionTranslations?rows=1000&languagecodes=es&offset=" "https://distribution-xml.booking.com/xml/bookings.getHotelPhotos?rows=1000&offset=" "https://distribution-xml.booking.com/xml/bookings.getHotelFacilityTypes?languagecodes=es" "https://distribution-xml.booking.com/xml/bookings.getHotelFacilities?rows=1000&languagecodes=es&offset=" "https://distribution-xml.booking.com/xml/bookings.getRoomPhotos?rows=1000&offset=" "https://distribution-xml.booking.com/xml/bookings.getHotelDescriptionPhotos?rows=1000&offset=" "https://distribution-xml.booking.com/xml/bookings.getRoomTranslations?languagecodes=es&rows=1000&offset=")
nombres=("hotels" "descriptions" "images" "facilities" "hotelfacility" "hotelroomsphotos" "descriptionphotos" "hotelroomstranslations")
resultNode="<result>"

user="Cocha"
password="Cocha.123"

lastChangeParameter=""
if [ $useLastChange ]; then
	lastChangeParameter="&last_change="
	if [ -f $lastChangeFile ];
	then
		lastChangeValue=`cat $lastChangeFile`
		lastChangeParameter="$lastChangeParameter$lastChangeValue"
	fi
fi

echo [`date`] "Creando carpeta temporal"
mkdir -p $tempDirectory
cd $tempDirectory
index=0
for url in "${urls[@]}"
do
	stop=0
	offset=0
	while [ $stop -eq 0 ]
	do
        if [ "${nombres[index]}" == "facilities" ];
        then
            echo [`date`] "Bajando archivo ${nombres[index]}.xml"
            echo [`date`] "url: $url"
            curl --user $user:$password $url > ${nombres[index]}.xml
            echo [`date`] "Moviendo archivo ${nombres[index]}.xml"
            mv ${nombres[index]}.xml $eanHotelsInput
            stop=1
        else
            echo [`date`] "Bajando archivo ${nombres[index]}$offset.xml"
            echo [`date`] "url: $url$offset$lastChangeParameter"
            curl --user $user:$password $url$offset$lastChangeParameter > ${nombres[index]}$offset.xml
            if grep -Fq "$resultNode" ${nombres[index]}$offset.xml
            then	
                echo [`date`] "Moviendo archivo ${nombres[index]}$offset.xml"
                mv ${nombres[index]}$offset.xml $eanHotelsInput
                offset=$((offset + 1000))
            else
                stop=1
            fi
        fi
	done
	${currentDirectory}/slack-alert.sh "*bkgHotelsLastChanged.sh* >> Fin de ${nombres[index]}"	
	((index++))
done
echo [`date`] "Borrando archivos temporales"
rm *.*

echo [`date`] "Avisando a Slack"
${currentDirectory}/slack-alert.sh "END >> *bkgHotelsLastChanged.sh* en $(( SECONDS - start )) seg \nCorrió con lastChanged: >> $lastChangeParameter"

date +"%Y-%m-%d" > $lastChangeFile
exit 0
