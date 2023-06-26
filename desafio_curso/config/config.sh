#!/bin/bash
#caminho do projeto docker com os repositórios usados no projeto
CSV_URL=https://raw.githubusercontent.com/caiuafranca/dados_curso/main/
#caminho da pasta dos arquivos csv de entrada
CSV_DIR="/desafio_curso/raw"
#caminho HDFS
HDFS_DIR="/datalake/raw"
#nome das tabelas
TABLES=("VENDAS" "CLIENTES" "ENDERECO" "REGIAO" "DIVISAO")
TARGET_DATABASE="DESAFIO_CURSO"
TARGET_STAGE_DATABASE="stg_DESAFIO_CURSO"
SERVER="prod"
#data atual no sistema
DATE="$(date --date="-0 day" "+%Y%m%d")"
PARTICAO="$(date --date="-0 day" "+%Y%m%d")"