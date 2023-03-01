#!/bin/bash

#input
SCENER=$1
DBNAME=$2
DBPATH=$3
FAFILE=$4

#conditions
if [ $SCENER = "demo" ]
then
	#demomode is chosen
	#download and unzip Pilot-Demobases
	cd /mnt/vol1
	wget --no-check-certificate https://pilot.ascon.ru/beta/Databases.zip
	unzip Databases.zip
	$DBPATH="/mnt/vol1/Databases"
	if [ $DBNAME = "pilot-bim_ru" ]
	then
		#attach demobase pilot-bim_ru with filearchive marker
		$FAFILE="44191f9c-c8a4-4689-b38b-474f2aba4465.pilotfa"
		/App/Ascon.Pilot.Daemon --add /App/settings.xml $DBNAME $DBPATH/$DBNAME/base.dbp $DBPATH/$DBNAME/FileArchive/$FAFILE
	else
		#attach demobase without filearchive marker
		/App/Ascon.Pilot.Daemon --add /App/settings.xml $DBNAME $DBPATH/$DBNAME/base.dbp $DBPATH/$DBNAME/FileArchive
	fi
else
	#attach custom base
	/App/Ascon.Pilot.Daemon --add /App/settings.xml $DBNAME $DBPATH/$DBNAME/base.dbp $DBPATH/$DBNAME/FileArchive/$FAFILE
fi

