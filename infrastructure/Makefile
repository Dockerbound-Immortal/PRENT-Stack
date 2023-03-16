# Infrastructure
INFRASTRUCTURE_COMPOSE_FILE=docker-compose.yml
DATABASE_COMPOSE_FILE=db/docker-compose.yml

.PHONY: all

all: networks infra

infra:
	docker-compose -f $(DATABASE_COMPOSE_FILE) up --build -d
	docker-compose -f $(INFRASTRUCTURE_COMPOSE_FILE) up --build -d

networks:
	docker network create microservice-network
	docker network create cv-builder-network
