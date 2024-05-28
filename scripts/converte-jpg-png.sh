#!/bin/bash

converte_imagem(){
cd ~/Downloads/imagens-livros
if [ ! -d png ]
then
    mkdir png
fi

for IMAGEM in *.jpg
do
    local IMAGEM_SEM_EXTENSAO=$(ls $IMAGEM | awk -F. '{ print $1 }')
    convert $IMAGEM_SEM_EXTENSAO.jpg png/$IMAGEM_SEM_EXTENSAO.png
done
}

converte_imagem 2>erros.txt
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo"
fi