# shell-scripting

##### shell

 interface de acesso aos recursos no SO

##### scripting

 lista de comandos que serão interpretados pelo SO

##### descritores de arquivos

 indicadores de acesso de arquivos e recursos de entrada e saída

##### fluxos padrões

 referenciados por números

- 0: entrada padrão
- 1: saída padrão
- 2: mensagens de erro

---

##### `#!/bin/bash`, pra que serve?

- indicar qual é o interpretador dos comandos do script, presente na primeira linha do script
- sem isso também é possível executar o script, o interpretador de comandos é carregado no momento do login do usuário (/etc/passwd), porém com isso a interpretação é mais rápida

##### como utilizar parâmetros dentro do script?

- indicar que é um parâmetro utilizando $ precedido de um número, que referencia qual parâmetro será usado
- para pegar o primeiro parâmetro, utilizamos no script $1

##### `*.jpg`, qual a utilidade do `*`?

- metacaractere usado para dterminar que, em um determinado campo pode-se existir qualquer caractere em qualquer quantidade
- por exemplo, `*.jpg` busca por arquivos que terminam com *.jpg*, independente dos caracteres anteriores a isso

##### variáveis

- `nome_var=$(comando)`
  - armazena nessa variável o resultado da excução do comando
- comandos envolvidos por `$()`: são executado em um subshell
- termo `local`: indica que a variável tem escopo local

##### `echo teste > arquivo.txt` != `echo teste >> arquivo.txt`

- ambos escrevem informações em um determinado arquivo
- no primeiro caso, o comando sobrescreve todo o conteúdo dentro do arquivo, caso tenha algum, para escrever o novo
- o segundo junta o conteúdo já presente dentro do arquivo com a informação nova

---

##### `$@`

- referencia todos os parâmetros passados para um script, sem quantidade determinada

##### `awk -F. '{ print $1 }'`

- *awk*: usado para processamento de texto
- *-F.*: especifica um campo delimitador do texto passado
  - nesse caso, o "corte" acontece no texto onde tivermos o .
- *{ print $1 }*: imprimir a primeira parte da mensagem

##### `[ $? -eq 0 ]`

- `$?`: pegar o status de saída da função
- `-eq`: verificação de igualdade
