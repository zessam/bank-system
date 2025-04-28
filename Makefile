#port is 5433 for postgres 
DB_URL=postgresql://postgres:postgres@localhost:5433/bank_system?sslmode=disable

network:
	docker network create bank-network

postgres:
	docker run --name postgres --network bank-network -p 5433:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:latest

mysql:
	docker run --name mysql8 -p 3306:3306  -e MYSQL_ROOT_PASSWORD=secret -d mysql:8

createdb:
	docker exec -it postgres createdb --username=root --owner=root bank_system

dropdb:
	docker exec -it postgres dropdb bank_system

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migrateup1:
	migrate -path db/migration -database "$(DB_URL)" -verbose up 1

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 

migratedown1:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 1

sqlc: 
	sqlc generate