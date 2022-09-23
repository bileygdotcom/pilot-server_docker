#!/bin/bash

chmod +x /App/Ascon.Pilot.Daemon
/App/Ascon.Pilot.Daemon --admin settings.xml root whale
cp settings.xml /mnt/vol1/settings.xml
mkdir /mnt/vol1/Databases
