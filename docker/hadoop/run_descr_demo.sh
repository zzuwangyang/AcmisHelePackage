yes|/hadoop-3.2.1/bin/hdfs namenode -format
/bin/bash -c /hadoop-3.2.1/sbin/start-dfs.sh
/hadoop-3.2.1/bin/hdfs dfs -mkdir /user
/hadoop-3.2.1/bin/hdfs dfs -mkdir /user/root
/hadoop-3.2.1/bin/hdfs dfs -mkdir input
/hadoop-3.2.1/bin/hdfs dfs -put etc/hadoop/*.xml input
/hadoop-3.2.1/bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar grep input output 'dfs[a-z.]+'
/hadoop-3.2.1/bin/hdfs dfs -get output output
cat output/*
