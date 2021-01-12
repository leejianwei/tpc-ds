#!/bin/bash

FACTS="store_sales store_returns web_sales web_returns catalog_sales catalog_returns inventory"

for t in ${FACTS}
do
table_name=${t}
for file_name in `ls ../data/fact/${t}*.dat`; do
    table_file=$(echo "${file_name##*/}")
    #table_name=$(echo "${table_file%_*}" | awk -F '_' '{print $1}' | tr '[:upper:]' '[:lower:]')
    upload_data_sql="INSERT INTO $table_name FORMAT CSV"

    echo "$upload_data_sql <-- $(du -h $file_name)"

    cat $file_name | clickhouse-client --format_csv_delimiter="|" --max_partitions_per_insert_block=100 --database="tpcds" --query="$upload_data_sql"
    rm $file_name

    sleep 5
done

done


