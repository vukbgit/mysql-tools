A set of bash scripts to deal with a MySQL database

## INSTALLATION ##

* clone repository:

`git clone https://github.com/vukbgit/mysql-tools.git`

* setup config file:

`cp .config.template .config`

* edit config file setting:
	* db_source: name of the database to start comparison
	* db_target: name of the database to be compared to db_source
	* user: MySQL user name into scripts
	* password: MySQL user password
	* host and port if needed

## SCRIPTS ##

* `compare.sh`: makes a comparison using mysqldbcompare, unfortunately not useful for automatic datyabase synchronization

* `export.sh [database-name] [table-name]`: dumps a whole database or just a table if second argument provided

* `import.sh -d [database-name] -f [path-to-dump-file]`: imports a database from a dump file

* `create_objects.sh [object-1] [object-2] ...`: shows create sql for tables/views 
