#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#confirm choices
echo "you choose to overwrite DEV database with PROD database"
printf "are you sure? [y,N]"
read ok
ok="${ok:=n}"
case $ok in
  n) echo -e "${e1}let's do nothing, exiting${e2}";exit;;
esac
#dump dev & prod
source $DIR/dump-dev-prod.sh
echo "restoring $FILE_PROD..."
mysql -u $DEV_USER -p$DEV_PASSWORD $DEV_DB < $FILE_PROD
