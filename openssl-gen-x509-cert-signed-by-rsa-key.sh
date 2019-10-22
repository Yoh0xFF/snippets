#!/bin/sh

# Generate private key
openssl genrsa -out test.rsa.key 2048

# Convert private key to pkcs8 format
openssl pkcs8 -topk8 -nocrypt -inform PEM -outform PEM -in test.rsa.key -out test.rsa.key.pkcs8

# Generate certificate request
openssl req -new -out test.crt.csr -key test.rsa.key

# Generate x509 certificate der
openssl x509 -out test.crt -outform der -days 730 -req -in test.crt.csr -signkey test.rsa.key

# Generate x509 certificate pem
openssl x509 -out test.crt.pem -outform pem -days 730 -req -in test.crt.csr -signkey test.rsa.key

# generate x509 certificat in one command
openssl req -x509 -newkey rsa:4096 -keyout test.key.pem -out test.crt.pem -days 365

# Decrypt encrypted private key
openssl rsa -in test.key.pem.encrypted -out test.key.pem.decrypted
