#!/usr/bin/make
name := hadoop-tajo
#nikolauska/

version := 2.6.0

v :
	@echo "version ${name}:${version}"
rmi:
	docker rmi -f ${name}:${version}

run:
	docker run  -itd    --name ${name}${version} cdecl/${name}:${version}

del:
	docker rm -f  ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash