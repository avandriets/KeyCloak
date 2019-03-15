FROM jboss/keycloak:latest

COPY ./certificates/ /etc/x509/https
