#!/usr/bin/make
repo :=registry.cn-chengdu.aliyuncs.com/sunwu
name :=acmis_hadoop
version := v0.1.10

v :
	@echo "version ${name}:${version}"

rmi:
	docker rmi -f ${name}:${version}

run:
	docker run  -itd -p 22222:80 -p 22223:443  --name ${name}${version} ${name}:${version}

del:
	docker rm -f ${name}${version}

exe:
	docker exec -it ${name}${version} /bin/bash

bld :
	docker build -t ${repo}/${name}:${version} .

push:
#	docker push  --disable-content-trust  ${repo}/${name}:${version}
	docker push ${repo}/${name}:${version}

login:
	docker login --username=at2133n4o@aliyun.com registry.cn-chengdu.aliyuncs.com
pull:
	docker pull registry.cn-chengdu.aliyuncs.com/sunwu/acmis_hadoop:${version}