# CentOS Linux release 7.7.1908 (Core)
FROM akshays/hawq_hadoop:latest

#设置环境变量
# SSH
RUN  yum makecache fast && yum -y install openssh-server openssh-clients passwd

RUN sed -i "s/#PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config
RUN sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config


# SSH- 本地免密访问
#RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
#    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
#    chmod 0600 ~/.ssh/authorized_keys

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

# 启动
EXPOSE 22
ENTRYPOINT /init.sh
