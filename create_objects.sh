#!/bin/bash
source ./.config

for object in "$@"
do
    mysql -h $host -P $port -u $user -p$password -D $db_source -E -e "SHOW CREATE TABLE $object"
done