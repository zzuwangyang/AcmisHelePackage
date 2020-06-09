FROM centos:centos7
ADD  jdk1.8.0_144.tar.gz /
ADD  hadoop-3.2.1.tar.gz /
ENV   HADOOP_HOME=/hadoop-3.2.1/
ENV  JAVA_HOME=/jdk1.8.0_144
ENV  PATH=$PATH:/hadoop-3.2.1/bin
ENV  PATH=$PATH:$JAVA_HOME/bin
ADD rundemo $HADOOP_HOME/.
WORKDIR /hadoop-3.2.1
RUN  echo "export JAVA_HOME=/jdk1.8.0_144" >> /hadoop-3.2.1/etc/hadoop/hadoop-env.sh \
     && yum -y install dos2unix \
     && dos2unix $HADOOP_HOME/rundemo \
     && chmod +x $HADOOP_HOME/rundemo


CMD /bin/bash
