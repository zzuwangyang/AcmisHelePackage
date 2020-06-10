repo :=  aaionap
name := hbase
ver := 1.2.0

run:
	docker run -itd --name ${name}${ver} ${repo}/${name}:${ver}

del:
	docker rm -f ${name}${ver}

e:
	docker exec -it ${name}${ver} /bin/bash

#	I have also faced the same issues, to fix, download the jar files from the below url
    #
    #http://commons.apache.org/logging/download_logging.cgi
    #
    #and copy to your lib folder, will resolve your issue.
# https://apachemirror.sg.wuchna.com//commons/logging/binaries/commons-logging-1.2-bin.tar.gz
#java.lang.ClassNotFoundException: org.slf4j.LoggerFactory