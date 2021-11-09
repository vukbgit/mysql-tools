DIR="/var/www/clients/client1/web13/home/dugongo_gest_dev/mysql_sync"
source $DIR/.config
yearMonth=$(date +"%y%m")
filename=$(date +"%u_%H%M")
db="hbcwebtools"
dumpfile="/var/www/clients/client1/web13/home/dugongo_gest_dev/mysql_sync/bak/"$filename".dump"
echo "dumping weekday db "$db" to file "$dumpfile
mysqldump -u $user -p$password -C $db > $dumpfile
monthfile="/var/www/clients/client1/web13/home/dugongo_gest_dev/mysql_sync/bak/"$yearMonth".dump"
echo "copying to month file "$monthfile
#mysqldump -u $user -p$password $db > $file
cp $dumpfile $monthfile
