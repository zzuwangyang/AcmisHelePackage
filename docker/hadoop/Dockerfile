FROM centos:centos8
ADD  jdk1.8.0_144.tar.gz /
ADD  hadoop-3.2.1.tar.gz /
ENV   HADOOP_HOME=/hadoop-3.2.1/
ENV  JAVA_HOME=/jdk1.8.0_144
ENV  PATH=$PATH:/hadoop-3.2.1/bin
ENV  PATH=$PATH:$JAVA_HOME/bin
WORKDIR /hadoop-3.2.1
COPY run_descr_demo.sh .

#设置环境变量
RUN  yum -y install openssh-server openssh-clients passwd
RUN  echo $'\
export JAVA_HOME=/jdk1.8.0_144\n\
export HDFS_NAMENODE_USER=root\n\
export HDFS_DATANODE_USER=root\n\
export HDFS_SECONDARYNAMENODE_USER=root\n\
export YARN_RESOURCEMANAGER_USER=root\n\
export YARN_NODEMANAGER_USER=root\n'>> /$HADOOP_HOME/etc/hadoop/hadoop-env.sh

RUN sed -i "s/#PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config
RUN sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config

# 添加 Hadoop 配置文件
RUN rm -f etc/hadoop/core-site.xml && rm -f etc/hadoop/hdfs-site.xml
ADD core-site.xml etc/hadoop/core-site.xml
ADD hdfs-site.xml etc/hadoop/hdfs-site.xml

# 本地免密访问
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

# 修改 root 密码
RUN echo root|passwd --stdin root

# ssh
RUN mkdir -p /var/run/sshd
RUN /usr/bin/ssh-keygen -A

# init program
COPY init.sh /run.sh
RUN chmod 755 /run.sh


# ssh
EXPOSE 22
# hadoop
EXPOSE 9870
ENTRYPOINT /run.sh
