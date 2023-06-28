#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG="${BASEDIR}/../../config/config.sh"
source "${CONFIG}"

echo "criação de tabelas no hive"

for table in "${TABLES[@]}"
do
    echo " "
    echo "Criação da tabela "$table
    #HDFS_DIR="/datalake/raw"
    TARGET_TABLE_EXTERNAL="$table"
    TARGET_TABLE_GERENCIADA="tbl_$table"
    #docker exec -it hive-server beeline -u jdbc:hive2://localhost:10000 \

    echo "target database: ${TARGET_DATABASE}"
    echo "diretorio hdfs: ${HDFS_DIR}"
    echo "target table: ${TARGET_TABLE_EXTERNAL}"
    echo "target table gerenciada: ${TARGET_TABLE_GERENCIADA}"
    
    beeline -u jdbc:hive2://localhost:10000 \
    --hivevar TARGET_DATABASE="${TARGET_DATABASE}"\
    --hivevar HDFS_DIR="${HDFS_DIR}"\
    --hivevar TARGET_TABLE_EXTERNAL="${TARGET_TABLE_EXTERNAL}"\
    --hivevar TARGET_TABLE_GERENCIADA="${TARGET_TABLE_GERENCIADA}"\
    --hivevar PARTICAO="${PARTICAO}"\
    -f /input/desafio_curso/scripts/hql/create_table_$table.hql;
done