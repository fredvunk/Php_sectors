To start project use command:
###docker-compose up

If needed to give user privileges for db querys as user
### docker exec -it db bash
### mysql -h localhost -P 3306 --protocol=tcp -uroot -pMYSQL_ROOT_PASSWORD
### grant ALL PRIVILEGES ON *.* TO 'MYSQL_USER';
### flush privileges