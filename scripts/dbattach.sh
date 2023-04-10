#!/bin/bash

#input
SCENERY=$1
DBNAME=$2
DBPATH=$3
FAFILE=$4

#conditions
if [ "$SCENERY" = "demo" ]
then
	#demomode is chosen
	#download and unzip Pilot-Demobases
	cd /mnt/vol1
	wget --no-check-certificate https://pilot.ascon.ru/beta/Databases.zip
	echo "Demobase archive is downloaded."
	unzip Databases.zip
	echo "Demobase archive is unzipped."
	DBPATH="/mnt/vol1/Databases"
	if [ $DBNAME = "pilot-bim_ru" ]
	then
		#attach demobase pilot-bim_ru with filearchive marker
		FAFILE="44191f9c-c8a4-4689-b38b-474f2aba4465.pilotfa"
		/App/Ascon.Pilot.Daemon --add /App/settings.xml $DBNAME $DBPATH/$DBNAME/base.dbp $DBPATH/$DBNAME/FileArchive/$FAFILE
		echo "Demobase " $DBNAME "is attached"
	else
		#attach demobase without filearchive marker
		/App/Ascon.Pilot.Daemon --add /App/settings.xml $DBNAME $DBPATH/$DBNAME/base.dbp $DBPATH/$DBNAME/FileArchive
		echo "Demobase " $DBNAME "is attached"
	fi
elif [ "$SCENERY" = "base" ]
then
	#attach custom base
	/App/Ascon.Pilot.Daemon --add /App/settings.xml $DBNAME $DBPATH/$DBNAME/base.dbp $DBPATH/$DBNAME/FileArchive/$FAFILE
	echo $DBPATH $DBNAME " attached." 
else
	#nothing
	echo "Ain't no base attached."
fi

