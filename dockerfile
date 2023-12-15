# Image de base.
FROM ubuntu:latest
# Auteur.
MAINTAINER : ByllStephane
# Mises a jour de notre image.
RUN apt-get update 
# Creation de notre server Nginx et install git sans permission.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
# Expose le port du conteneur.
EXPOSE 85
# Nettoyer notre repertoire html pour l'avoir vide.
RUN rm -rf /var/www/html/*
# Install notre application dans le repertoire html.
RUN git clone https://github.com/byll2023/Site-Web-type.git /var/www/html/
#ADD ./Site-Web-type  /var/www/html/

# Definir au conteneur le processus de redemarage.
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
