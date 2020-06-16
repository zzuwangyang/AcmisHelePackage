# 构建 spark
#FROM centos:centos7
#ADD  Python-3.7.0.tgz /python/
#ADD  spark-3.0.0-preview2-bin-hadoop2.7.tgz /spark/
#ADD  jdk-8u144-linux-x64.tar.gz /jdk
#ENV  JAVA_HOME=/jdk/jdk1.8.0_144
#RUN  yum install -y epel-release && \
#     yum makecache &&  \
#     yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel&& \
#     yum clean all &&\
#     cd /python/Python-3.7.0 \
#     && ./configure prefix=/usr/local/python3 \
#     && make \
#     && make install \
#     && ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3 \
#     && ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip3 \
#     && pip3 install --upgrade pip \
#     && pip3 install pyspark
#WORKDIR /spark
FROM registry.cn-chengdu.aliyuncs.com/sunwu/acmis_spark:v0.1.10
# SSH
RUN  yum -y install openssh-server openssh-clients passwd

RUN sed -i "s/#PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config
RUN sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config


# SSH- 本地免密访问
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

# SSH- 修改 root 密码
RUN echo root|passwd --stdin root

#SSH -开机自启动   配合 ENTRYPOINT /sbin/init
RUN mkdir -p /var/run/sshd
RUN /usr/bin/ssh-keygen -A
#RUN echo '/usr/sbin/sshd -D' >> /etc/rc.d/rc.local
#RUN chmod +x  /etc/rc.d/rc.local
# init program
RUN echo $'/usr/sbin/sshd -D\n\
tail -f /dev/null\n' >/init.sh && chmod +x /init.sh
# hadoop
WORKDIR /spark
ENTRYPOINT  /init.sh
