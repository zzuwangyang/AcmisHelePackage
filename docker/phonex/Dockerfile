# CentOS Linux release 7.7.1908 (Core)
FROM bergwerkio/phoenix-1.3:1.0

MAINTAINER 孙武@gsunwu@163.com
#设置环境变量
# SSH
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt update && apt install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd

RUN rm -rf /etc/ssh/sshd_config
COPY sshd_config /etc/ssh/sshd_config

RUN echo '/usr/sbin/sshd -D\n\
tail -f /dev/null\n' >/init.sh && chmod +x /init.sh

EXPOSE 22

ENTRYPOINT /init.sh