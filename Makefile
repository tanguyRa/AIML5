GREEN  := $(shell tput -Txterm setaf 2)
WHITE  := $(shell tput -Txterm setaf 7)
YELLOW := $(shell tput -Txterm setaf 3)
RESET  := $(shell tput -Txterm sgr0)
ARCH   := $(shell uname -m)

PROJECT_NAME=notebook-seed

.PHONY:start stop clean restart stats teardown help
start: ##@Code start a dev environment, then launch jupyter notebook
	docker run -ti --rm  \
		-p 8888:8888 \
		-e JUPYTER_LAB_ENABLE=yes \
		-v $(PWD)/notebooks\:/home/jovyan/notebooks \
		-v $(PWD)/data\:/home/jovyan/data \
		--name $(PROJECT_NAME)-jupyter \
		jupyter/datascience-notebook \
		jupyter notebook

stop: ##@Environment stop the fabric blockchain and dev envrionment
	-docker stop $(PROJECT_NAME)-jupyter

clean: stop ##@Environment clean out temporary files, containers, etc
	-docker rm $$(docker ps -aq --filter "name=$(PROJECT_NAME)-jupyter" --format="{{.ID}}")

restart: stop clean start ##@Environment restarts a dev environment, launch test with watcher

teardown: stop clean ##@Environment completely remove any containers, images, leftovers on the system
	-docker rmi "jupyter/datascience-notebook"

stats: ##@other useful docker stats with formating
	docker stats --format "table {{.Container}}\t{{.CPUPerc}}\t{{.Name}}"

help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

HELP_FUN = \
	%help; \
	while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
	print "usage: make [target]\n\n"; \
	for (sort keys %help) { \
		print "${WHITE}$$_:${RESET}\n"; \
		for (@{$$help{$$_}}) { \
			$$sep = " " x (32 - length $$_->[0]); \
			print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
	}; \
	print "\n"; }
