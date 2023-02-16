#/bin/sh
ksqldb_key=$(/usr/bin/terraform output -raw ksqldb-api-key)
ksqldb_secret=$(/usr/bin/terraform output -raw ksqldb-api-secret)
ksqldb_endpoint=$(/usr/bin/terraform output -raw ksqldb-endpoint)
ksqldb_sql_file="/host/create-users-stream.sql"

echo running ksqldb-cli

/usr/bin/docker run --volume="$(pwd):/host" --rm confluentinc/ksqldb-cli:0.28.2 ksql \
     --file $ksqldb_sql_file  \
     -u $ksqldb_key \
     -p $ksqldb_secret \
     $ksqldb_endpoint
