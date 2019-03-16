#!/usr/bin/env bash

openssl req -new -sha256 -nodes -out ./out/tls.csr -newkey rsa:2048 -keyout ./out/tls.key -config <( cat server.csr.cnf )

openssl x509 -req -in ./out/tls.csr -CA ./out/keyCloak.pem -CAkey ./out/keyCloak.key -CAcreateserial -out ./out/tls.crt -days 500 -sha256 -extfile v3.ext
