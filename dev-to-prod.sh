#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#confirm choices
echo "you choose to overwrite PROD database with DEV database"
printf "are you sure? [y,N]"
read ok
ok="${ok:=n}"
case $ok in
  n) echo -e "${e1}let's do nothing, exiting${e2}";exit;;
esac
#dump dev & prod
source $DIR/dump-dev-prod.sh
echo "restoring $FILE_DEV..."
mysql -u $PROD_USER -p$PROD_PASSWORD $PROD_DB < $FILE_DEV
