#!/usr/bin/make
name := sqoop-shell
#nikolauska/
#stratio/sqoop-shell:0.2.2
version := 0.2.2

v :
	@echo "version ${name}:${version}"
rmi:
	docker rmi -f ${name}:${version}

run:
	docker run  -itd  --name ${name}${version} stratio/${name}:${version}

del:
	docker rm -f  ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash