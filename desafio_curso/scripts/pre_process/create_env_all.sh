#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG="${BASEDIR}/../../config/config.sh"
source "${CONFIG}"

# Criação das pastas e envio dos arquivos ao HDFS
echo 'Exportação de arquivos ao HDFS'
cd ../   /raw/
for table in "${TABLES[@]}"
   do   
      echo "Envio da tabela $table."
      cd  $table
      docker exec -it namenode hdfs dfs -mkdir /datalake/raw/$table/
      docker exec -it namenode hdfs dfs -chmod 777 /datalake/raw/   able/
      docker exec -it namenode hdfs dfs -copyFromLocal /input/curso_minsait/raw/$table/$table.csv /datalake/raw/$table/    
      echo "Envio da tabela $table finalizado."
   done
cd ../
echo "Exportação de arquivos ao HDFS em ${DATE} finalizada."



