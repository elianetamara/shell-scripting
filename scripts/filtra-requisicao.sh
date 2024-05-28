#!/bin/bash

cd ~/Downloads

if [ -z $1 ]
then
    while [ -z $REQUISICAO ]
    do
        read -p "Voce esqueceu de colocar o parametro (GET,PUT,POST,DELETE): " REQUISICAO
        LETRA_MAIUSCULA=$(echo $REQUISICAO | awk '{ print toupper($1) }')
    done
else
    LETRA_MAIUSCULA=$(echo $1 | awk '{ print toupper($1) }')
fi

case $LETRA_MAIUSCULA in
        GET)
        cat apache.log | grep GET
        ;;

        POST)
        cat apache.log | grep POST
        ;;

        PUT)
        cat apache.log | grep PUT
        ;;

        DELETE)
        cat apache.log | grep DELETE
        ;;

        *)
        echo "O parametro passado nao e valido"
        ;;
esac