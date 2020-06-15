#!/bin/bash
#HADOOP_HOME=/hadoop-3.2.1
#yes|$HADOOP_HOME/bin/hdfs namenode -format # 自动确认
#$HADOOP_HOME/sbin/start-dfs.sh # 启动hdfs
#$HADOOP_HOME/sbin/start-all.sh
#/hadoop-3.2.1/sbin/start-all.sh
/usr/sbin/sshd -D
tail -f /dev/null