# Date : 25/09/21
# Source author : Cyrille Grandval
# Edited by Arthur Djikpo & Etienne Crespi

CONSOLE=bin/console
DC=docker-compose
HAS_DOCKER:=$(shell command -v $(DC) 2> /dev/null)

ifdef HAS_DOCKER
	ifdef PHP_ENV
		EXECROOT=$(DC) exec -Te PHP_ENV=$(PHP_ENV) php
		EXEC=$(DC) exec -Te PHP_ENV=$(PHP_ENV) php
	else
		EXECROOT=$(DC) exec -T php
		EXEC=$(DC) exec -T php
	endif
else
	EXECROOT=
	EXEC=
endif

.DEFAULT_GOAL := help

.PHONY: help ## Generate list of targets with descriptions
help:
		@grep '##' Makefile \
		| grep -v 'grep\|sed' \
		| sed 's/^\.PHONY: \(.*\) ##[\s|\S]*\(.*\)/\1:\2/' \
		| sed 's/\(^##\)//' \
		| sed 's/\(##\)/\t/' \
		| expand -t14

##
## Project setup & day to day shortcuts
##---------------------------------------------------------------------------
.PHONY: env ## Init
env:
	$(RUN) cp docker-compose.override.yml.dist docker-compose.override.yml
	$(RUN) cp sample.env .env
	echo "Please fill environment files, then use make all"

.PHONY: docker ## Install the project (Install in first place)
docker:
	$(DC) pull || true
	$(DC) --env-file .env build
	$(DC) --env-file .env up -d

.PHONY: stop ## Stop the project
stop:
	$(DC) down

.PHONY: exec ## Run bash in the php container
exec:
	$(EXEC) /bin/bash
