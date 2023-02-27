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
RUN ["chmod","+x","/App/Ascon.Pilot.Daemon"]
RUN ["/App/Ascon.Pilot.Daemon","--admin","/App/settings.xml","root","whale"]
CMD /App/Ascon.Pilot.Daemon --add /App/settings.xml pilot-bim_ru /mnt/vol1/Databases/pilot-bim_ru/base.dbp /mnt/vol1/Databases/pilot-bim_ru/FileArchive/d95564b5-97c8-4b97-a043-25c4451dba00.pilotfa && /usr/bin/supervisord
