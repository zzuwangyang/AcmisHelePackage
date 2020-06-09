#!/usr/bin/make
name := phoenix
#nikolauska/

version := 1.6.6

v :
	@echo "version ${name}:${version}"
rmi:
	docker rmi -f ${name}:${version}

run:
	docker run  -itd    --name ${name}${version} nikolauska/${name}:${version}-centos7

del:
	docker rm -f  ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash