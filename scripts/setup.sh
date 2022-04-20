#!/bin/bash

/usr/bin/dotnet Ascon.Pilot.Daemon.dll --admin settings.xml root whale
cp settings.xml /mnt/vol1/settings.xml
