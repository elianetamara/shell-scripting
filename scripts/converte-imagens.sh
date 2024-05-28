#!/bin/bash

converte_imagem(){
    local CAMINHO_IMAGEM=$1
    local IMAGEM_SEM_EXTENSAO=$(ls $CAMINHO_IMAGEM | awk -F. '{ print $1 }')
    convert $IMAGEM_SEM_EXTENSAO.jpg $IMAGEM_SEM_EXTENSAO.png
}

varrer_diretorio(){
    cd $1
    for ARQUIVO in *
    do
        local CAMINHO_ARQUIVO=$(find ~/Downloads/imagens-novos-livros -name $ARQUIVO)
        if [ -d $CAMINHO_ARQUIVO ]
        then
            varrer_diretorio $CAMINHO_ARQUIVO
        else
            converte_imagem $CAMINHO_ARQUIVO
        fi
    done
}

varrer_diretorio ~/Downloads/imagens-novos-livros
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve um problema na conversão"
fi