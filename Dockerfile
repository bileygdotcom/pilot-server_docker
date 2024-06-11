# syntax=docker/dockerfile:1
FROM bileyg/hangar:1.3

LABEL project="Pilot-Server"\
      version="1.9" \
      mantainer="bileyg"\
      company="Ascon"
      
COPY build /App/
COPY scripts /App/
COPY supervisor /etc/supervisor/conf.d/
WORKDIR /App
EXPOSE 5545
RUN mkdir Update
CMD /usr/bin/supervisord
