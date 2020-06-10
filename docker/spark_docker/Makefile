#!/usr/bin/make
repo :=registry.cn-chengdu.aliyuncs.com/sunwu
name :=acmis_spark
version := v0.1.10

v :
	@echo "${repo}/${name}:${version}"
rmi:
	docker rmi -f ${name}:${version}

run: delete
	docker run -it --name ${name}${version} ${name}:${version} /bin/bash

delete:
	docker rm -f  ${name}${version}

bld :
	docker build -t ${repo}/${name}:${version} .

push:
#	docker push  --disable-content-trust  ${repo}/${name}:${version}
	docker push ${repo}/${name}:${version}

login:
	docker login --username=at2133n4o@aliyun.com registry.cn-chengdu.aliyuncs.com
pull:
	docker pull ${repo}/${name}:${version}