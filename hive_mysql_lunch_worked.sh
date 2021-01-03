docker run -p 3306:3306 --name hive_mysql_autostart -e MYSQL_ROOT_PASSWORD=hivePassw0rd --restart unless-stopped -v $(pwd):/var/lib/mysql -d mysql:latest
