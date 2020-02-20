# What is this repository? #
Course repository for the AIML5 SUP INFO course. This repository downloads and uses a self contained development environment. You only need Docker to run the code present in this notebooks.

Course content are in Jupyter notebooks and can be found in the `notebooks/` repository.

Put the downloaded data for the course in the `data/` repository.

`make start` will start your development environment and the notebook.
You can copy and paste the notebook url that shows in your console to your favorite decent browser.

Once you're done with the course, call `make teardown` to remove the docker images stored on your computer and free up your hard drive.

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
