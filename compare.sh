#!/bin/bash
source ./.config
#compare
#mysqldiff --server1=$user:$password@$host:$port --difftype=sql --force $db_target:$db_source
mysqldbcompare --server1=$user:$password@$host:$port --difftype=sql $db_target:$db_source --run-all-tests --skip-data-check
exit 0
