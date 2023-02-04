# syntax=docker/dockerfile:1
FROM bileyg/hangar:latest

LABEL project="Pilot-Server"\
      version="1.2" \
      mantainer="bileyg"\
      company="Ascon Complex"

COPY build App/
COPY scripts /App/
WORKDIR /App
EXPOSE 5545
RUN mkdir Update
COPY supervisor /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord"]
