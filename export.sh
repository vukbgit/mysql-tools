DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.config
now=$(date +"%y%m%d_%H%M%S")
db=$1
table=$2
file_path=$DIR"/dump/"$db
if [ -z $db ]; then
        echo "specify db as first parameter"
else
    if [ -z $table ]; then
        echo "exporting db "$db
	file=$file_path"_"$now".dump"
    else
        echo "exporting table "$db"."$table
	file=$file_path"_"$table"_"$now".dump"
    fi
    mysqldump -u $user -p$password $db $table > $file
fi
