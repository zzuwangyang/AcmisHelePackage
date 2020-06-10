repo :=  datagrip
name := greenplum
ver := 6.1

run:
	docker run -itd --name ${name}${ver} ${repo}/${name}:${ver}

del:
	docker rm -f ${name}${ver}

e:
	docker exec -it ${name}${ver} /bin/bash