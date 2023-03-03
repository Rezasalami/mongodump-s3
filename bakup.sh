#!/bin/sh
DIR=`date +%m%d%y`
DEST=/db_backups/$DIR
DESTTAR=/db_backups/$DIR.tar
mkdir $DEST
mongodump -h <host> -p 27017 -d <db-name> --gzip  --authenticationDatabase "admin" -u admin -p <password> -o $DEST
tar cf $DESTTAR $DEST
rm -rf $DEST
s3cmd put -r $DESTTAR s3://mongodb

for i in $(find /db_backups -atime 10 -type f); do
        FILENAME=$(basename $i);
        s3cmd del s3://mongodb/$FILENAME
done


find /db_backups/ -atime 10 -type f -exec rm -f {} \;
