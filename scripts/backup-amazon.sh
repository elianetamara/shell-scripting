#!/bin/bash

CAMINHO_BACKUP=/home/eliane/backup_mutillidae_amazon
cd $CAMINHO_BACKUP
DATA=$(date +%F)
if [ ! -d $DATA ]
then
    mkdir $DATA
fi

TABELAS=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for TABELA in $TABELAS
do
    mysqldump -u root mutillidae $TABELA > $CAMINHO_BACKUP/$DATA/$TABELA.sql
done

aws s3 sync $CAMINHO_BACKUP s3://curso-shell-script