# Base image use debian
FROM bitnami/minideb:latest
ENV TZ=Europe/Luxembourg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Tag maintainer 
MAINTAINER Arhs³ | GLPI Partner <infrastructure@arhs-cube.com>
MAINTAINER Gilles Zoratti
# Install base packages
RUN apt-get update
RUN apt-get install tzdata wget perl systemctl -y 
RUN apt-get upgrade -y
# Create the main repository for the perl installer
RUN mkdir /opt/glpi
WORKDIR /opt/glpi

# Download perl installer 
RUN wget https://github.com/glpi-project/glpi-agent/releases/download/1.4/glpi-agent-1.4-linux-installer.pl

# Run the installer with parameter
RUN perl /opt/glpi/glpi-agent-1.4-linux-installer.pl -s $url --tag=$tag --logfile=/var/log/glpi-agent.log --service --runnow

# Run the glpi-agent service with restart
EXPOSE 62354
EXPOSE 80
#RUN service glpi
RUN /usr/bin/systemctl enable glpi-agent
CMD ["systemctl", "start", "glpi-agent"]
