#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
NOW=$(date +"%y%m%d_%H%M%S")
#dump prod
FILE_PATH="$DIR/$DUMP_FOLDER/$PROD_DB"
      echo "exporting db "$PROD_DB
FILE_PROD=$FILE_PATH"_"$NOW".dump"
mysqldump -u $PROD_USER -p$PROD_PASSWORD $PROD_DB > $FILE_PROD
#dump dev
FILE_PATH="$DIR/$DUMP_FOLDER/$DEV_DB"
      echo "exporting db "$DEV_DB
FILE_DEV=$FILE_PATH"_"$NOW".dump"
mysqldump -u $DEV_USER -p$DEV_PASSWORD $DEV_DB > $FILE_DEV
