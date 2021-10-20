#Base image for openmrs
#Download base image ubuntu 18.04
FROM ubuntu:18.04


LABEL mantainer="Agnaldo Samuel  <asamuel@pedaids.org>"

# Update Ubuntu Software repository
# Install dependencies 4cWabyz?2"l*
RUN apt-get update && \
apt-get install -y curl wget apt-utils net-tools inetutils-ping nano



# Download and install Apache tomcat 8
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz && \
tar -xzf apache-tomcat-8.5.9.tar.gz -C /var/lib/  && \
mv /var/lib/apache-tomcat-8.5.9  /var/lib/tomcat8 && \
rm -rf /var/lib/tomcat8/webapps/examples && \
rm -rf /var/lib/tomcat8/webapps/docs && \
rm -rf /var/lib/tomcat8/webapps/ROOT && \
rm -f apache-tomcat-8.5.9.tar.gz

# Install Oracle JDK
RUN wget https://www.dropbox.com/s/u0wbewtgq7hny34/jdk-8u301-linux-x64.tar.gz?dl=0  && \
    mv jdk-8u301-linux-x64.tar.gz?dl=0   jdk-8u301-linux-x64.tar.gz && \
    mkdir /opt/jdk && \
    tar -zxf jdk-8u301-linux-x64.tar.gz -C /opt/jdk && \
    rm jdk-8u301-linux-x64.tar.gz && \
    update-alternatives --install /usr/bin/java  java  /opt/jdk/jdk1.8.0_301/bin/java 100 && \
    update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_301/bin/javac 100 && \
    update-alternatives --install /usr/bin/jar   jar   /opt/jdk/jdk1.8.0_301/bin/jar 100

RUN apt-get clean && rm -rf  /tmp/* /var/tmp/*


COPY webapps/openmrs.war   /var/lib/tomcat8/webapps/
COPY setenv.sh    /var/lib/tomcat8/bin/

RUN  mkdir /root/.OpenMRS
COPY OpenMRS/modules/  /root/.OpenMRS/modules
RUN chmod -R 755 /root/.OpenMRS/
COPY openmrs-runtime.properties /root/.OpenMRS



ENV CATALINA_HOME /var/lib/tomcat8
ENV PATH $PATH:$CATALINA_HOME/bin


VOLUME ["/var/lib/tomcat8/webapps","/root/"]

WORKDIR /var/lib/tomcat8/bin

EXPOSE 8080

# Launch Tomcat
CMD ["catalina.sh", "run"]



