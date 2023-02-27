# syntax=docker/dockerfile:1
FROM bileyg/hangar:0.9

LABEL project="Pilot-Server"\
      version="1.5" \
      mantainer="bileyg"\
      company="Ascon Complex"

COPY build App/
COPY scripts /App/
WORKDIR /App
EXPOSE 5545
RUN mkdir Update
COPY supervisor /etc/supervisor/conf.d/
RUN ["/usr/bin/dotnet","./Ascon.Pilot.Daemon","-aс","./settings.xml","pilot-bim_ru","/mnt/vol1/Databases/pilot-bim_ru/base.dbp","/mnt/vol1/Databases/pilot-bim_ru/FileArchive/d95564b5-97c8-4b97-a043-25c4451dba00.pilotfa"]
RUN ["/usr/bin/dotnet","/App/Ascon.Pilot.Daemon.dll","--db","./settings.xml","root","whale"]
CMD ["/usr/bin/supervisord"]
