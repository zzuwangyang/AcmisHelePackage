#!/usr/bin/make
namespace := akshays
name := hawq_hadoop
#akshays/hawq_hadoop
version := latest


v :
	@echo "version ${name}:${version}"
rmi:
	docker rmi -f ${name}:${version}

run:
	docker run -e "container=docker"  --privileged   -itd  -v /sys/fs/cgroup:/sys/fs/cgroup/usr/sbin/init --name ${name}${version} ${namespace}/${name}:${version}

del:
	docker rm -f  ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash