#!/usr/bin/make
name :=swspark
version := 0.1

v :
	@echo "version ${name}:${version}"
build :
	docker build -t ${name}:${version} .
rmi:
	docker rmi -f ${name}:${version}

run: delete
	docker run -it --name ${name}${version} ${name}:${version} /bin/bash

delete:
	docker rm -f  ${name}${version}
