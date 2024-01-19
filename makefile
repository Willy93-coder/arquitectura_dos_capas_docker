create-network:
	docker network create -d bridge my-bridge-network

rm-network:
	docker network rm my-bridge-network

build-db:
	cd mysql-db && \
	docker build -t mysql-db:0.1 . && \
	cd ..

build-node-app:
	cd node-app && \
	docker build -t node-app:0.1 . && \
	cd ..

run-mysql-db:
	docker run -d --network my-bridge-network --name mysql-db-run mysql-db:0.1

stop-mysql-db:
	docker stop node-app-run

run-node-app:
	docker run -d -e TARGET="mysql-db-run" --network my-bridge-network -p 54321:3000 --name node-app-run node-app:0.1

stop-node-app:
	docker container stop node-app-run

extract:
	docker cp 5f1460d7925a:/etc/mysql/mysql.conf.d/mysqld.cnf /Users/willy/Desktop/DAM/sistemas_gestion/arquitectura_dos_capas/mysql-db/mysqld.cnf

rm-node-app:
	docker network rm node-app-run
