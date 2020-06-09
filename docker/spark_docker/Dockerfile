FROM centos:centos7
ADD  Python-3.7.0.tgz /python/
ADD  spark-3.0.0-preview2-bin-hadoop2.7.tgz /spark/
ADD  jdk-8u144-linux-x64.tar.gz /jdk
ENV  JAVA_HOME=/jdk/jdk1.8.0_144
RUN  yum install -y epel-release && \
     yum makecache &&  \
     yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel&& \
     yum clean all &&\
     cd /python/Python-3.7.0 \
     && ./configure prefix=/usr/local/python3 \
     && make \
     && make install \
     && ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3 \
     && ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip3 \
     && pip3 install --upgrade pip \
     && pip3 install pyspark

WORKDIR /spark
CMD /bin/bash
