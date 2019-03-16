# KeyCloak compose for test

### To run keycloak use folloving command

```
$ docker-compose -f docker-compose.yml up --build
```

You can find keycloak on port 18080 your local host
login: admin
password: admin


### generate certificate for localhost

This certificate does not work in chrome because there aren't 'alternatoveNames' and 'DNS'  

keytool -genkey -alias ec2-35-180-69-249.eu-west-3.compute.amazonaws.com -keyalg RSA -keystore keycloak.jks -validity 10950
keytool -importkeystore -srckeystore keycloak.jks -destkeystore keycloak.p12 -deststoretype PKCS12
openssl pkcs12 -in keycloak.p12 -nokeys -out tls.crt
openssl pkcs12 -in keycloak.p12 -nocerts -nodes -out tls.key

### Generate right certificate

run from certificate-tool folder
```
$ create_root_cA.sh.sh
```
it creates folder ./out and put there two files keyCloak.key and keyCloak.pem

next run
```
$ create_self-signed_certificate.sh.sh
```

it creates three files "tls.crt tls.csr tls.key" inside folder ./out

copy "tls.crt tls.csr tls.key" to ./certs folder of repo

!keycloak docker image use just tls.* files
other magic inside docker-compose.yml :)

If you want customize certificate with your domain name etc.
you should change server.csr.cnf and v3.ext files.
