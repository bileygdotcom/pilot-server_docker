# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/runtime:5.0
COPY build App/
COPY scripts /App/
WORKDIR /App
EXPOSE 5545
RUN apt-get update && apt-get install -y supervisor && apt-get install -y unzip
RUN mkdir Update
COPY supervisor /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord"]
#ENTRYPOINT /usr/bin/supervisord #-nc /etc/supervisor/supervisord.conf
#ENTRYPOINT dotnet Ascon.Pilot.Daemon.dll /mnt/vol1/settings.xml
