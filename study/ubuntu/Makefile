
repo :=
name := ubuntu
ver := groovy-20200505
pull:
	docker pull ${name}:${ver}

t:
#	x=$(docker ps -a|grep ubuntugroovy-20200505) &&	echo $x
#	docker ps -a|grep ${name}${ver}|awk 'BEGIN {FS="\t"}{ print $1}'|xargs echo

run:
	docker run -it --name ${name}${ver}  ${name}:${ver} /bin/bash

del:
	docker rm -f ${name}${ver}
# apt update
# apt-get  install software-properties-common
# add-apt-repository ppa:greenplum/db