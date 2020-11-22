docker run -d --restart unless-stopped -p 3306:3306 --name mariadb_server_autostart  -e DB_NAME=temp_db -e DB_USER=alex -e DB_PASS=\!Passw0rd  mariadb_server_w_data
