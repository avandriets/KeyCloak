#!/usr/bin/env bash
mkdir ./out
mkdir ./out/server

openssl genrsa -des3 -out ./out/keyCloak.key 2048
openssl req -x509 -new -nodes -key ./out/keyCloak.key -sha256 -days 1024 -out ./out/keyCloak.pem
