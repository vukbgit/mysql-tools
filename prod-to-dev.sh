#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
NOW=$(date +"%y%m%d_%H%M%S")
#dump prod
FILE_PATH="$DIR/$DUMP_FOLDER/$PROD_DB"
      echo "exporting db "$PROD_DB
FILE=$FILE_PATH"_"$NOW".dump"
mysqldump -u $PROD_USER -p$PROD_PASSWORD $PROD_DB > $FILE
#confirm choices
echo "you choose to import file $FILE into $DEV_DB"
printf "is it ok? [y,N]"
read ok
ok="${ok:=n}"
case $ok in
  n) echo -e "${e1}let's do nothing, exiting${e2}";exit;;
esac
read -sp "MySQL root password: " ROOT_PWD
echo "restoring..."
mysql -u root -p$ROOT_PWD $DEV_DB < $FILE
