#!/bin/bash

DIMS="date_dim time_dim item customer_demographics household_demographics customer_address customer store promotion warehouse ship_mode reason income_band call_center web_page catalog_page web_site"
FACTS="store_sales store_returns web_sales web_returns catalog_sales catalog_returns inventory"

mkdir data/dim
for t in ${DIMS}
do
for file_name in `ls ../data/${t}*.dat`; do
	cp $file_name data/dim/
done

done


