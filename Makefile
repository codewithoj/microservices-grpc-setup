
build_broker:
	cd ../microservices-grpc-broker-service && env GOOS=linux CGO_ENABLED=0 go build -o brokerApp ./cmd/api

build_auth:
	cd ../microservices-grpc-auth-service && env GOOS=linux CGO_ENABLED=0 go build -o authApp ./cmd/api

build_inventory:
	cd ../microservices-grpc-inventory-service && env GOOS=linux CGO_ENABLED=0 go build -o inventoryApp ./cmd/api


start_broker:
	cd ../microservices-grpc-broker-service && docker run -it --rm --name broker-service -p 8080:8080 broker-app

start_auth:
	cd ../microservices-grpc-auth-service && docker run -it --rm --name auth-service -p 8081:8081 auth-app

start_inventory:
	cd ../microservices-grpc-inventory-service && docker run -it --rm --name inventory-service -p 8082:8082 inventory-app

start:
	docker compose up

stop:
	docker compose down
