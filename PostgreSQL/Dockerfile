#Base image for PostgresSQL 9.6 on ubuntu 16.04
#Download base image ubuntu 16.04
FROM ubuntu:16.04
LABEL mantainer="Agnaldo Samuel  <asamuel@pedaids.org>"



# Download and install PostgreSQL
 RUN apt-get install -y lsb-release  software-properties-common && \ 
 add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"  && \
 wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -   && \
 apt-get update   && \
 apt-get install -y  postgresql-9.6

RUN  mkdir /opt/data
RUN apt-get clean && rm -rf  /tmp/* /var/tmp/*


EXPOSE 5432

update-rc.d postgresql defaults

CMD ["cd /opt/data"]



