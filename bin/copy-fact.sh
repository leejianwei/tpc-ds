#!/bin/bash

FACTS="store_sales store_returns web_sales web_returns catalog_sales catalog_returns inventory"

mkdir data/fact
for t in ${FACTS}
do
for file_name in `ls ../data/${t}*.dat`; do
	cp $file_name data/fact/
done

done


