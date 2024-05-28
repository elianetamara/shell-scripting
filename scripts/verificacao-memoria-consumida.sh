#!/bin/bash
MEMORIA_TOTAL=$(free | grep -i mem | awk '{ print $2 }')
MEMORIA_CONSUMIDA=$(free | grep -i mem | awk '{ print $3 }')
RELACAO_MEMORIA=$(bc <<< "scale=2;$MEMORIA_CONSUMIDA/$MEMORIA_TOTAL *100" | awk -F. '{ print $1 }')

if [ $RELACAO_MEMORIA -gt 50 ]
then
mail -s "Consumo de memória acima do limite" adm.mutllidae@gmail.com<<del
O consumo de memoria esta acima do limite que foi especificado. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }')
del

fi