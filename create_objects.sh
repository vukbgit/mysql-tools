#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
NOW=$(date +"%y%m%d_%H%M%S")
DIFF_FILE=$DIFF_FOLDER"/"$NOW"_create.sql"
#target
source $DIR/include/choose-target.sh
for object in "$@"
do
    mysql -h $HOST -P $PORT -u $TARGET_USER -p$TARGET_PASSWORD -D $TARGET_DB -E -e "SHOW CREATE TABLE $object" >> $DIFF_FILE
done
sed -i 's/\*\*\*/--***/' $DIFF_FILE
sed -i 's/^\s*Table:/--Table:/' $DIFF_FILE
sed -i 's/^\s*View:/--View:/' $DIFF_FILE
sed -i 's/^\s*Create Table: //' $DIFF_FILE
sed -i 's/^\s*Create View: //' $DIFF_FILE
sed -i 's/CREATE ALGORITHM=UNDEFINED DEFINER=`c2_dev`@`localhost` SQL SECURITY DEFINER VIEW/CREATE OR REPLACE VIEW/' $DIFF_FILE
echo -e "\ncreate objects file $DIFF_FILE created"
exit 0
