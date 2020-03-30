#Base image for PostgreSQL Container
#Download base image ubuntu 16.04
FROM ubuntu:16.04


LABEL mantainer="Agnaldo Samuel  <asamuel@pedaids.org>"

# Update Ubuntu Software repository
# Install dependencies
RUN apt-get update && \
apt-get install -y curl wget apt-utils net-tools inetutils-ping nano

# Download and install PostgreSQL
 RUN apt-get install -y lsb-release  software-properties-common && \ 
 add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"  && \
 wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -   && \
 apt-get update   && \
 apt-get install -y  postgresql-9.6

   
RUN apt-get clean && rm -rf  /tmp/* /var/tmp/*


WORKDIR /etc/init.d/

EXPOSE 5432

# Launch PostgreSql
CMD ["postgresql", "run"]



