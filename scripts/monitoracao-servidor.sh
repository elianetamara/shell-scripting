#!/bin/bash

RESPOSTA_HTTP=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

if [ $RESPOSTA_HTTP -ne 200 ]
then
    mail -s "Problema no servidor" adm.mutillidae@gmail.com<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteúdo web.
del
    systemctl restart apache2
fi