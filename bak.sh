#!/bin/bash
#makes daily + monthly backup
#USAGE: pass a DEV|PROD parameter to force target db otherwise it wilòl be choosen by hand
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
#target
TARGET=$1
if [ -z $TARGET ]; then
  source $DIR/include/choose-target.sh
else
  TARGET_DB_VAR="${TARGET}_DB"
  TARGET_DB=${!TARGET_DB_VAR}
  TARGET_USER_VAR="${TARGET}_USER"
  TARGET_USER=${!TARGET_USER_VAR}
  TARGET_PASSWORD_VAR="${TARGET}_PASSWORD"
  TARGET_PASSWORD=${!TARGET_PASSWORD_VAR}
fi
#folder
WEEKDAY=$(date +"%u_%H%M")
YEARMONTH=$(date +"%y%m")
BASE_FILE_PATH="$DIR/$BAK_FOLDER/$TARGET_DB"
WEEKFILE="${BASE_FILE_PATH}-${WEEKDAY}.dump"
echo "dumping weekday db "$TARGET_DB" to file "$WEEKFILE
mysqldump -u $TARGET_USER -p$TARGET_PASSWORD -C $TARGET_DB > $WEEKFILE
MONTHFILE="${BASE_FILE_PATH}-${YEARMONTH}.dump"
echo "copying to month file "$MONTHFILE
cp $WEEKFILE $MONTHFILE
