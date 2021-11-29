#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
NOW=$(date +"%y%m%d_%H%M%S")
DIFF_FILE=$DIFF_FOLDER"/"$NOW"_diff.sql"
#compare
#mysqldiff --server1=$user:$password@$host:$port --difftype=sql --force $db_target:$db_source
read -sp "MySQL root password: " ROOT_PWD
mysqldbcompare --server1=root:$ROOT_PWD@$HOST:$PORT --server2=root:$ROOT_PWD@$HOST:$PORT --difftype=sql $PROD_DB:$DEV_DB --run-all-tests --skip-data-check > $DIFF_FILE
echo -e "\ndiff file $DIFF_FILE created"
exit 0
