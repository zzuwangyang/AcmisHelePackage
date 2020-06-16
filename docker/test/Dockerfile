FROM registry.cn-chengdu.aliyuncs.com/sunwu/centos-sshd:v0.1.0

#设置环境变量
RUN mkdir /test
WORKDIR /test
RUN touch a.txt

# hadoop
ENTRYPOINT /sbin/init
#ENTRYPOINT /usr/sbin/sshd -D
