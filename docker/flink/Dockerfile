# CentOS Linux release 7.7.1908 (Core)
FROM flink:scala_2.12

MAINTAINER 孙武@gsunwu@163.com
# SSH
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt update && apt install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
#RUN sed -i "s/#PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
#RUN sed -i "s/#Port 22/Port 22/g" /etc/ssh/sshd_config
#RUN sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
#
RUN sed  's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo '/usr/sbin/sshd -D\n\
tail -f /dev/null\n' >/init.sh && chmod +x /init.sh

EXPOSE 22

ENTRYPOINT /init.sh