# CentOS Linux release 7.7.1908 (Core)
FROM stratio/sqoop-shell:0.2.2

MAINTAINER 孙武@gsunwu@163.com

# SSH
# from https://docs.docker.com/engine/examples/running_ssh_service/
RUN apt-get install -y openssh-server
#RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo '/usr/sbin/sshd -D\n\
tail -f /dev/null\n' >/init.sh && chmod +x init.sh
EXPOSE 22

ENTRYPOINT /init.sh

