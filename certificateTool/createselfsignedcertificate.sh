#!/usr/bin/env bash

openssl req -new -sha256 -nodes -out ./out/server/server.csr -newkey rsa:2048 -keyout ./out/server/server.key -config <( cat server.csr.cnf )

openssl x509 -req -in ./out/server/server.csr -CA ./out/keyCloak.pem -CAkey ./out/keyCloak.key -CAcreateserial -out ./out/server/server.crt -days 500 -sha256 -extfile v3.ext

