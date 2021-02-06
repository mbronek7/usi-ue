PROJECT ?= usi

export PROJECT

network:
	docker network create usi

dev-build:
		docker-compose -f docker-compose.yml -p $(PROJECT) build
dev-up:
		docker-compose -f docker-compose.yml -p $(PROJECT) up -d
dev: dev-build dev-up
		docker-compose -f docker-compose.yml -p $(PROJECT) exec usi bash
bash:
		docker-compose -f docker-compose.yml -p $(PROJECT) exec app bash

clean:
	docker-compose \
		-f docker-compose.yml \
		-p $(PROJECT) \
		down \
		--remove-orphans
