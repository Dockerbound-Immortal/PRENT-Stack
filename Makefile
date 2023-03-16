# Infrastructure
INFRASTRUCTURE_COMPOSE_FILE=infrastructure/docker-compose.yml
DATABASE_COMPOSE_FILE=infrastructure/db/docker-compose.yml

# CV Builder
CV_BUILDER_API_COMPOSE_FILE=services/cv-builder/api/docker-compose.yml
CV_BUILDER_CLIENT_COMPOSE_FILE=services/cv-builder/client/docker-compose.yml

.PHONY: all infra cv-builder networks dev stop

all: networks cv-builder infra

dev: networks cv-builder
	docker-compose -f $(DATABASE_COMPOSE_FILE) up --build -d

cv-builder: networks
	cd services/cv-builder/api && yarn install
	cd services/cv-builder/client && yarn install
	docker-compose -f $(CV_BUILDER_API_COMPOSE_FILE) up --build -d
	docker-compose -f $(CV_BUILDER_CLIENT_COMPOSE_FILE) up --build -d

api: networks
	cd services/cv-builder/api && yarn install
	docker-compose -f $(CV_BUILDER_API_COMPOSE_FILE) up --build -d
	docker-compose -f $(DATABASE_COMPOSE_FILE) up --build -d

client: networks
	cd services/cv-builder/client && yarn install
	docker-compose -f $(CV_BUILDER_CLIENT_COMPOSE_FILE) up --build -d

infra: networks
	docker-compose -f $(DATABASE_COMPOSE_FILE) up --build -d
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) up --build -d

networks:
	docker network create microservice-network
	docker network create cv-builder-network

stop:
	docker-compose -f $(CV_BUILDER_API_COMPOSE_FILE) down
	docker-compose -f $(CV_BUILDER_CLIENT_COMPOSE_FILE) down
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) down
	docker-compose -f $(DATABASE_COMPOSE_FILE) down
	docker network rm microservice-network || true
	docker network rm cv-builder-network || true