# syntax=docker/dockerfile:1
FROM bileyg/hangar:0.9

LABEL project="Pilot-Server"\
      version="1.5" \
      mantainer="bileyg"\
      company="Ascon Complex"
      
ENV ADMIN=root
ENV PASS=whale
ENV BASE=/mnt/vol1/Databases/pilot-bim_ru
ENV FILEARCH=d95564b5-97c8-4b97-a043-25c4451dba00.pilotfa

COPY build App/
COPY scripts /App/
WORKDIR /App
EXPOSE 5545
RUN mkdir Update
COPY supervisor /etc/supervisor/conf.d/
RUN ["chmod","+x","/App/Ascon.Pilot.Daemon"]
RUN /App/Ascon.Pilot.Daemon --admin /App/settings.xml $ADMIN $PASS
CMD /App/Ascon.Pilot.Daemon --add /App/settings.xml pilot-bim_ru $BASE/base.dbp $BASE/FileArchive/$FILEARCH && /usr/bin/supervisord
