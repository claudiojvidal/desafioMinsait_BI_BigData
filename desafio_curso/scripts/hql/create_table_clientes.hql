CREATE EXTERNAL TABLE IF NOT EXISTS ${TARGET_DATABASE}.${TARGET_TABLE_EXTERNAL} ( 
   addressNumber string,
   businessFamily string,
   businessUnit string,
   customer string,
   customerKey string,
   customerType string,
   division string,
   lineOfBusiness string,
   phone string,
   regionCode string,
   regionalSalesMgr string,
   searchType string
)
COMMENT 'Tabela de '${TARGET_TABLE_EXTERNAL}
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE
location '${HDFS_DIR}'
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS ${TARGET_DATABASE}.${TARGET_TABLE_GERENCIADA} (
   addressNumber string,
   businessFamily string,
   businessUnit string,
   customer string,
   customerKey string,
   customerType string,
   division string,
   lineOfBusiness string,
   phone string,
   regionCode string,
   regionalSalesMgr string,
   searchType string
)
PARTITIONED BY (DT_FOTO STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.orc.OrcSerde' 
STORED AS INPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat' 
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat' 
TBLPROPERTIES ( 'orc.compress'='SNAPPY');

SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE
   ${TARGET_DATABASE}.${TARGET_TABLE_GERENCIADA}
PARTITION(DT_FOTO) 
SELECT
   addressNumber string,
   businessFamily string,
   businessUnit string,
   customer string,
   customerKey string,
   customerType string,
   division string,
   lineOfBusiness string,
   phone string,
   regionCode string,
   regionalSalesMgr string,
   searchType string
   ${PARTICAO} as DT_FOTO
FROM ${TARGET_DATABASE}.${TARGET_TABLE_EXTERNAL}
;