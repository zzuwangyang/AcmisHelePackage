# CentOS Linux release 7.7.1908 (Core)
FROM datagrip/greenplum:6.1

MAINTAINER 孙武@gsunwu@163.com
# SSH
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt update && apt install -y openssh-server
RUN echo 'root:root' | chpasswd
RUN sed  's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN echo '/usr/sbin/sshd -D\n\
tail -f /dev/null\n' >/init.sh && chmod +x /init.sh

EXPOSE 22

ENTRYPOINT /init.sh