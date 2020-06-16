etc/hadoop/core-site.xml
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>

etc/hadoop/hdfs-site.xml
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
      
ssh localhost


bin/hdfs namenode -format
sbin/start-dfs.sh


ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

# SSH
https://blog.csdn.net/baibaigao/article/details/80956417
先检查有没有安装ssh服务
rpm -qa | grep ssh

yum install -y openssh-server
vi /etc/ssh/sshd_config
Port 22
PermitRootLogin

/bin/systemctl start sshd.service

Failed to get D-Bus connection: Operation not permitted
centos7的bug，换用centos8 

System has not been booted with systemd as init system (PID 1). Can't operate.
.容器的entrypoint需要设置init
ENTRYPOINT ["/sbin/init"]


bash: ssh: command not found
yum -y install openssh-clients


## Error
Starting namenodes on [localhost]
ERROR: Attempting to operate on hdfs namenode as root
ERROR: but there is no HDFS_NAMENODE_USER defined. Aborting operation.
Starting datanodes
ERROR: Attempting to operate on hdfs datanode as root
ERROR: but there is no HDFS_DATANODE_USER defined. Aborting operation.
Starting secondary namenodes [04b5ccad3444]
ERROR: Attempting to operate on hdfs secondarynamenode as root
ERROR: but there is no HDFS_SECONDARYNAMENODE_USER defined. Aborting operation.


edit your hadoop-env.sh
export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export YARN_RESOURCEMANAGER_USER=root
export YARN_NODEMANAGER_USER=root

# Dockerfile
##多行文本
``` 
必须是单引号
RUN echo $'\n\
name \n\
sex \n'>> start-ovs.sh
```

ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
