#!/usr/bin/make
name :=dez
version := v0.1.0

v :
	@echo "version ${name}:${version}"
bld :
	docker build -t ${name}:${version} .
rmi:
	docker rmi -f ${name}:${version}

run:
	docker run  -itd -p 22222:80 -p 22223:443  --name ${name}${version} ${name}:${version}

del:
	docker rm -f  ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash