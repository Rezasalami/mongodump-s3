# mongodump-s3
mongodump on s3 use cron and s3cmd

## install s3cmd
apt install s3cmd

## config s3cmd
s3cmd --configure

## add S3 Endpoint sampel 
s3.ir-thr-at1.arvanstorage.ir
[%(bucket).s3.ir-thr-at1.arvanstorage.ir]

## after finish save it on '/root/.s3cfg'
## test s3cmd show baket
s3cmd ls

## add crontab
crontab -e
30 00 * * * ~/scripts/bakup.sh
