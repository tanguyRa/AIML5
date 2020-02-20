# What is this repository? #
Basic Jupyter notebook development environment in Docker container.

# What do I need ? #
 - docker

# How to use it ? #

## Quickstart commands ##
 - `make start` start a dev environment, then start Jupyter notebook
 - `make stop` stop the dev environment
 - `make clean` clean out temporary files, containers, etc
 - `make restart` restart from a fresh environment (useful to prevent side effects)
 - `make test` run unit tests if present
 - `make stats` provide informations on currently running docker containers
 - `make teardown` completely remove any containers, images, leftovers on the system
 - `make help` List out the different available commands

## For a more hands-on approach, consult the Makefile. ##
