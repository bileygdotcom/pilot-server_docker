# syntax=docker/dockerfile:1
FROM bileyg/hangar:0.9

LABEL project="Pilot-Server"\
      version="1.4" \
      mantainer="bileyg"\
      company="Ascon Complex"

COPY build App/
COPY scripts /App/
WORKDIR /App
EXPOSE 5545
RUN mkdir Update
COPY supervisor /etc/supervisor/conf.d/
RUN ["/usr/bin/dotnet","/App/Ascon.Pilot.Daemon.dll","--admin","./settings.xml","root","whale"]
CMD ["/usr/bin/supervisord"]
