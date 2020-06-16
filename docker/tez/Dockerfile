FROM centos:centos7
ADD  jdk1.8.0_144.tar.gz /
ADD  hadoop-3.2.1.tar.gz /
ADD  apache-tez-0.9.0-bin.tar.gz /
ENV  TEZ_HOME=/apache-tez-0.9.0-bin
ENV  JAVA_HOME=/jdk1.8.0_144
ENV  HADOOP_HOME=/hadoop-3.2.1
ENV  PATH=$PATH:$HADOOP_HOME/bin
ENV  PATH=$PATH:$JAVA_HOME/bin
RUN  echo "export JAVA_HOME=/jdk1.8.0_144" >> /hadoop-3.2.1/etc/hadoop/hadoop-env.sh
WORKDIR /hadoop-3.2.1
CMD /bin/bash
