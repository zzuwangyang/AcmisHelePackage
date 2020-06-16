#!/usr/bin/make
repo :=registry.cn-chengdu.aliyuncs.com/sunwu
name :=centos-ubuntu16.4
version := v0.1.0
sshport :=40000

v :
	@echo "version ${repo}/${name}:${version}"

rmi:
	docker rmi -f ${name}:${version}

run:
	docker run -p ${sshport}:22  -itd --privileged  --name ${name}${version} ${repo}/${name}:${version}

del:
	docker rm -f ${name}${version}

e:
	docker exec -it ${name}${version} bash

bld :
	docker build -t ${repo}/${name}:${version} .

push:
#	docker push  --disable-content-trust  ${repo}/${name}:${version}
	docker push ${repo}/${name}:${version}

login:
	docker login --username=at2133n4o@aliyun.com registry.cn-chengdu.aliyuncs.com
pull:
	docker pull registry.cn-chengdu.aliyuncs.com/sunwu/acmis_hadoop:${version}
pre:
	yum install -y openssh-clients.x86_64

logs:
	docker logs ${name}${version}

rb:del bld run e

nb:bld run e