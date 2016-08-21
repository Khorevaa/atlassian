#!/bin/bash
echo "******CREATING BITBUCKET DATABASE*****"
gosu postgres psql --username postgres <<- EOSQL
   CREATE DATABASE bitbucket WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' \
       TEMPLATE template0;
   CREATE USER bitbucket;
   GRANT ALL PRIVILEGES ON DATABASE bitbucket to bitbucket;
EOSQL
echo ""

{ echo; echo "host bitbucket bitbucket 0.0.0.0/0 trust"; } >> "$PGDATA"/pg_hba.conf

if [ -r '/tmp/dumps/bitbucket.dump' ]; then
    echo "**IMPORTING BITBUCKET DATABASE BACKUP**"
    gosu postgres postgres &
    SERVER=$!; sleep 2
    gosu postgres psql bitbucket < /tmp/dumps/bitbucket.dump
    kill $SERVER; wait $SERVER
    echo "**BITBUCKET DATABASE BACKUP IMPORTED***"
fi

echo "******BITBUCKET DATABASE CREATED******"
