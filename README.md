# KeyCloak compose for test

### To run keycloak use folloving command

```
$ docker-compose -f docker-compose.yml up --build
```

You can find keycloak on port 18080 your local host
login: admin
password: admin


### generate certificate

keytool -genkey -alias ec2-35-180-69-249.eu-west-3.compute.amazonaws.com -keyalg RSA -keystore keycloak.jks -validity 10950
keytool -importkeystore -srckeystore keycloak.jks -destkeystore keycloak.p12 -deststoretype PKCS12
openssl pkcs12 -in keycloak.p12 -nokeys -out tls.crt
openssl pkcs12 -in keycloak.p12 -nocerts -nodes -out tls.key