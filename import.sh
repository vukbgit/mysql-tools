#!/bin/bash
source ./.config
while getopts d:f: option
do
    case "${option}"
        in
        d) db=${OPTARG};;
        f) file="./"$OPTARG;;
    esac
done

if [ -z $db ]; then
    echo "use option -d to set database"
elif [ -z $file ]; then
    echo "use option -f to set file path"
elif [ ! -f $file ]; then
    echo "file does not exist"
else
    echo "restoring..."
    mysql -u $user -p$password $db < $file
fi
