# Infrastructure
INFRASTRUCTURE_COMPOSE_FILE=infrastructure/docker-compose.yml
DATABASE_COMPOSE_FILE=infrastructure/db/docker-compose.yml

# CV Builder
CV_BUILDER_API_COMPOSE_FILE=services/cv-builder/api/docker-compose.yml
CV_BUILDER_CLIENT_COMPOSE_FILE=services/cv-builder/client/docker-compose.yml

.PHONY: all
.PHONY: infra
.PHONY: cv-builder
.PHONY: networks
.PHONY: dev

all:
	docker network create microservice-network
	docker network create cv-builder-network
	docker-compose -f $(CV_BUILDER_API_COMPOSE_FILE) up --build -d
	docker-compose -f $(CV_BUILDER_CLIENT_COMPOSE_FILE) up --build -d
	docker-compose -f $(DATABASE_COMPOSE_FILE) up --build -d
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) up --build -d

dev:
	docker network create microservice-network
	docker network create cv-builder-network
	docker-compose -f $(CV_BUILDER_API_COMPOSE_FILE) up --build -d
	docker-compose -f $(CV_BUILDER_CLIENT_COMPOSE_FILE) up --build -d
	docker-compose -f $(DATABASE_COMPOSE_FILE) up --build -d

cv-builder:
	docker-compose -f $(CV_BUILDER_API_COMPOSE_FILE) up --build -d
	docker-compose -f $(CV_BUILDER_CLIENT_COMPOSE_FILE) up --build -d

infra:
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) up --build -d

networks:
	docker network create microservice-network
	docker network create cv-builder-network