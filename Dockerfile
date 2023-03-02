# syntax=docker/dockerfile:1
FROM bileyg/hangar:1.0

LABEL project="Pilot-Server"\
      version="1.6" \
      mantainer="bileyg"\
      company="Ascon Complex"
      
ENV ADMIN=root
ENV PASS=whale
ENV SCENERY=""
ENV DBNAME=""
ENV DBPATH=""
ENV FAFILE=""

COPY build App/
COPY scripts /App/
WORKDIR /App
EXPOSE 5545
RUN mkdir Update
COPY supervisor /etc/supervisor/conf.d/
RUN ["chmod","+x","/App/Ascon.Pilot.Daemon"]
RUN ["chmod","+x","/App/dbattach.sh"]
RUN /App/Ascon.Pilot.Daemon --admin /App/settings.xml $ADMIN $PASS
CMD /App/dbattach.sh $SCENERY $DBNAME $DBPATH $FAFILE && /usr/bin/supervisord
