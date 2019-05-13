#!/bin/bash

### checking if all files downloaded correctly

for i in `ls *.sra`;
do
SRR=${i%%_*};
echo $SRR >> list.txt;
done

for j in `sort -u list.txt`
do
vdb-validate $j
done
