#
# Makefile for the Docker images of SIESTA on Debian
#

all all_targets default: siesta-debian

siesta-debian: debian/Dockerfile debian/packages.txt debian/requirements.txt
	cd debian && docker build --no-cache -t siesta-debian:latest .
	docker tag siesta-debian:latest pouillon/siesta:debian-latest

upload:
	docker push pouillon/siesta:debian-latest

clean:
	@echo "Nothing to do."

.PHONY: all all_targets clean default siesta-debian upload
