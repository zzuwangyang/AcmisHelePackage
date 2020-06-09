#!/usr/bin/make
name := greenplum

version := 6.1

v :
	@echo "version ${name}:${version}"
rmi:
	docker rmi -f ${name}:${version}

run:
	docker run  -itd    --name ${name}${version} datagrip/${name}:${version}

del:
	docker rm -f  ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash