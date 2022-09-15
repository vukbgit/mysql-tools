#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
NOW=$(date +"%y%m%d_%H%M%S")
#dump dev
FILE_PATH="$DIR/$DUMP_FOLDER/$DEV_DB"
      echo "exporting db "$DEV_DB
FILE=$FILE_PATH"_"$NOW".dump"
mysqldump -u $DEV_USER -p$DEV_PASSWORD $DEV_DB > $FILE
#confirm choices
echo "you choose to import file $FILE into $PROD_DB"
printf "is it ok? [y,N]"
read ok
ok="${ok:=n}"
case $ok in
  n) echo -e "${e1}let's do nothing, exiting${e2}";exit;;
esac
echo "restoring..."
mysql -u $PROD_USER -p$PROD_PASSWORD $PROD_DB < $FILE
