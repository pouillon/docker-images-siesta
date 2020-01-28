#
# Makefile for the Docker images of SIESTA on Debian
#

all all_targets default: siesta-debian

siesta-debian: Dockerfile packages.txt requirements.txt
	docker build --no-cache -t siesta-debian:latest .
	docker tag siesta-debian:latest pouillon/siesta:debian-latest

clean:
	@echo "Nothing to do."

.PHONY: all all_targets clean default siesta-debian
