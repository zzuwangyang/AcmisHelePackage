#!/usr/bin/make
name := tez
#nikolauska/

version := v0.5onHadoop2.5

v :
	@echo "version ${name}:${version}"
rmi:
	docker rmi -f ${name}:${version}

run:
	docker run  -itd    --name ${name}${version} sequenceiq/${name}:${version}

del:
	docker rm -f  ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash