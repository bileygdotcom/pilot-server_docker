# syntax=docker/dockerfile:1
FROM bileyg/hangar:0.6

LABEL project="Pilot-Server"\
      version="2.0" \
      mark="Dotnetless Debian"\
      mantainer="bileyg"\
      company="Ascon Complex"

COPY build App/
COPY scripts /App/
WORKDIR /App
EXPOSE 5545
#RUN ["dpkg","-i","libicu63_63.1-6+deb10u3_amd64.deb"]
#RUN ["apt-get","update"]
#RUN ["apt-get","install","-y","supervisor"]
RUN ["mkdir", "Update"]
RUN ["chmod","+x","Ascon.Pilot.Daemon"]
COPY supervisor /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord"]
