#!/bin/bash

cd ~/Downloads

REGEX="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $REGEX ]]
then
    cat apache.log | grep $1
    if [ $? -ne 0 ]
    then
        echo "O endereco IP procurado nao esta presente no arquivo"
    fi
else
    echo "Formato não é válido"
fi