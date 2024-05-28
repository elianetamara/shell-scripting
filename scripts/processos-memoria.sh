#!/bin/bash

if [ ! -d log ]
then
    mkdir log
fi

processos_memoria(){
PROCESSOS=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for PID in $PROCESSOS
do
    NOME_PROCESSO=$(ps -p $PID -o comm=)
    echo -n $(date +%F,%H:%M:%S,) >> log/$NOME_PROCESSO.log
    TAMANHO_PROCESSO=$(ps -p $PID -o size | grep [0-9])
    echo "$(bc <<< "scale=2;$TAMANHO_PROCESSO/1024") MB">> log/$NOME_PROCESSO.log
done
}

processos_memoria
if [ $? -eq 0 ]
then
    echo "Os arquivos foram salvos com sucesso"
else
    echo "Houve um problema na hora de salvar os arquivos"
fi