#!/bin/sh

cd $JAVA_HOME/jre/lib/security/

sudo keytool -import -alias cert-alias -file "/path/to/cert" -keystore cacerts

keytool -list -v -keystore cacerts -alias cert-alias
