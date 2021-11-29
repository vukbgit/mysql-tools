#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
NOW=$(date +"%y%m%d_%H%M%S")
#target
source $DIR/include/choose-target.sh
#optional table
TABLE=$1
FILE_PATH="$DIR/$DUMP_FOLDER/$TARGET_DB"
  if [ -z $TABLE ]; then
      echo "exporting db "$TARGET_DB
FILE=$FILE_PATH"_"$NOW".dump"
  else
      echo "exporting table "$TARGET_DB"."$TABLE
FILE=$FILE_PATH"_"$TABLE"_"$NOW".dump"
  fi
mysqldump -u $TARGET_USER -p$TARGET_PASSWORD $TARGET_DB $TABLE > $FILE
