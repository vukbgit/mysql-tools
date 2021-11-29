#!/bin/bash
targets=("development" "production")
printf "\nSelect the target db:\n"
select TARGET_FULL in "${targets[@]}"
do
  break
done
case $TARGET_FULL in
  development) TARGET="DEV";;
  production) TARGET="PROD";;
esac
#get db configuration
TARGET_DB_VAR="${TARGET}_DB"
TARGET_DB=${!TARGET_DB_VAR}
TARGET_USER_VAR="${TARGET}_USER"
TARGET_USER=${!TARGET_USER_VAR}
TARGET_PASSWORD_VAR="${TARGET}_PASSWORD"
TARGET_PASSWORD=${!TARGET_PASSWORD_VAR}
