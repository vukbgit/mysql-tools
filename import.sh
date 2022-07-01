#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config.sh
#check file
FILE=$1
if [ -z $FILE ]; then
    echo "dump file path to be restored must be passed as first parameter"
    exit 1
fi
#target
source $DIR/include/choose-target.sh
#confirm choices
echo "you choose to import file $FILE into $TARGET_DB"
printf "is it ok? [y,N]"
read ok
ok="${ok:=n}"
case $ok in
  n) echo -e "${e1}let's do nothing, exiting${e2}";exit;;
esac
echo "restoring..."
mysql -u $TARGET_USER -p$TARGET_PASSWORD $TARGET_DB < $FILE
