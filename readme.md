## Hadoop
> 已完成|已优化|可运行

https://www.yuque.com/gsunwu/acmis/okmnkc

mkdir -p /hadoop-3.2.1/input && cp -rf /hadoop-3.2.1/etc/hadoop/*.xml /hadoop-3.2.1/input
./bin/hadoop jar /hadoop-3.2.1/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar  grep input output 'dfs[a-z.]+'
./bin/hadoop version

## Sqoop
> 已完成|已优化|可运行

https://github.com/dvoros/docker-sqoop
未完成，谷歌百度没找到这个东西,是 sqoop 么

unauthorized: authentication required
docker pull dvoros/sqoop:hive2-sqoop1.4.7


docker pull stratio/sqoop-shell:0.2.2
opt/sds/sqoop-shell/bin/shell
Jun 04, 2020 8:37:07 PM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
Sqoop Shell: Type 'help' or '\h' for help.
sqoop:000> 

打包阿里云
docker pull stratio/sqoop-shell:0.2.2
docker tag docker.io/stratio/sqoop-shell:0.2.2 registry.cn-chengdu.aliyuncs.com/sunwu/acmis_sqoop-shell:0.1.0
docker push registry.cn-chengdu.aliyuncs.com/sunwu/acmis_sqoop-shell:0.1.0


## Hawq
> 已完成|已优化|-

https://www.yuque.com/gsunwu/acmis/oygxt3
https://hub.docker.com/r/akshays/hawq_hadoop
docker pull akshays/hawq_hadoop:latest
[root@k8s helm]# docker images|grep hawq
akshays/hawq_hadoop                  latest              a3c19228f955        3 years ago         4.95GB
docker tag  a3c19228f955  akshays/hawq_hadoop:1.0.0

[root@k8s helm]# docker images|grep hawq
akshays/hawq_hadoop                  1.0.0               a3c19228f955        3 years ago         4.95GB
akshays/hawq_hadoop                  latest              a3c19228f955        3 years ago         4.95GB


su bigdata
start-dfs.sh
cd /home/bigdata/hawq/hawq-2.0.0/
source greenplum_path.sh
hawq start cluster
psql -d postgres



docker pull akshays/hawq_hadoop:1.0.0
docker tag akshays/hawq_hadoop:1.0.0 registry.cn-chengdu.aliyuncs.com/sunwu/acmis_hawq:0.1.0
docker push registry.cn-chengdu.aliyuncs.com/sunwu/acmis_hawq:0.1.0

## Spark  
> 已完成|已优化|可运行


pip3 install --upgrade pip
pip3 install pyspark

安装 python3.7
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make libffi-devel
tar -zxvf Python-3.7.0.tgz
./configure prefix=/usr/local/python3
make && make install
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip3

kubectl exec -it swspark-k6b9x /bin/bash
cd spark-3.0.0-preview2-bin-hadoop2.7
./bin/pyspark 
textFile = spark.read.text("README.md")
textFile.count()


## Drill
> 完成|已优化|可运行

docker pull drill/apache-drill:1.17.0
kc exec -it swdrill-7mcw4 /bin/bash
cd opt/drill/
./bin/drill-embedded
Apache Drill 1.17.0
"A little SQL for your NoSQL."
apache drill> 

## Flink
> 完成|已优化|可运行

icon: https://flink.apache.org/img/flink-header-logo.svg
https://flink.apache.org/stateful-functions.html
docker pull flink:scala_2.12
kc exec -it flink-hsgst /bin/bash

root@flink-hsgst:/opt/flink# ./bin/flink -v
Version: 1.10.1, Commit ID: c5915cf


## Greenplum
>完成|已优化|可运行


http://docs.greenplum.org/6-4/common/gpdb-features.html
docker pull datagrip/greenplum:6.1
docker exec -it greenplum:6.1 /bin/bash
source greenplum_path.sh 

icon :https://s3.amazonaws.com/greenplum.org/wp-content/uploads/2018/10/30175109/logo-gpdb1.svg
root@59b6ae73575a:/# su gpadmin -l -c "/entrypoint.sh"
STARTING... (about 30 sec)
STARTED
GP_USER: tester
GP_PASSWORD: pivotal
GP_DB: testdb
CREATE ROLE
CREATE DATABASE
NOTICE:  resource queue required -- using default resource queue "pg_default"
CREATE ROLE
CREATE DATABASE
+-------------------------------------------------
|  CREATE USER tester WITH PASSWORD 'pivotal' SUPERUSER;
|  CREATE USER guest WITH PASSWORD 'guest';
+-------------------------------------------------
+-------------------------------------------------
|  CREATE DATABASE testdb WITH OWNER tester;
|  CREATE DATABASE guest WITH OWNER guest;
+-------------------------------------------------

 

## Phoenix 

docker pull bergwerkio/phoenix-1.3:1.0

icon: http://phoenix.apache.org/images/phoenix-logo-small.png

http://phoenix.apache.org/Phoenix-in-15-minutes-or-less.html
Phoenix is an open source SQL skin for HBase. You use the standard JDBC APIs instead of the regular HBase client APIs to create tables, insert data, and query your HBase data.

https://hub.docker.com/r/nikolauska/phoenix/tags
docker pull nikolauska/phoenix:1.6.6-centos
 
https://github.com/phoenixframework/phoenix


## Tajo
> 已完成|已优化|可运行

icon: http://tajo.apache.org/images/tajo_logo.png
http://tajo.apache.org/
Apache Tajo is a robust big data relational and distributed data warehouse system for Apache Hadoop.
sudo docker pull cdecl/hadoop-tajo:2.6.0

jps
/usr/local/tajo
root@a86285619bd8:/usr/local/tajo# ./bin/tajo version
Tajo 0.10.0
Git git@github.com:hyunsik/tajo.git -r 29f05214e46bc19ab0f1af9a17a2ab41932a0a1f
Compiled by hyunsik on 2015-02-24T03:41Z
Compiled with protoc 2.5.0
From source with checksum c56324e6262ceb0fd474ce2c1b7d276
This command was run using /usr/local/tajo-0.10.0/tajo-common-0.10.0.jar

## Tez

https://tez.apache.org/
The Apache TEZ® project is aimed at building an application framework which allows for a complex directed-acyclic-graph of tasks for processing data. It is currently built atop Apache Hadoop YARN.
镜像没法 pull  unauthorized: authentication required

https://hub.docker.com/r/dvoros/tez/tags
docker pull dvoros/tez:0.9.1


镜像没法 pull  unauthorized: authentication required
https://hub.docker.com/r/sequenceiq/tez
docker pull sequenceiq/tez:v0.5onHadoop2.5

镜像没法 pull  unauthorized: authentication required
https://hub.docker.com/r/jiaqijackjupiter/tez

相关文档
https://blog.csdn.net/yamaxifeng_132/article/details/78887971


## Rancher 改图标
images/logos/main.svg
apt-get install net-tools

https://blog.csdn.net/vah101/article/details/91368728?utm_medium=distribute.pc_relevant.none-task-blog-baidujs-3

https://github.com/rancher/rancher
查文件：https://www.cnblogs.com/AlexanderZhao/p/12009449.html
https://blog.csdn.net/weixin_43215250/article/details/84386788

docker pull rancher/rancher:v2.4-head
docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
find ./ | xargs grep -ril 'releases.rancher.com'
sed -i "s/releases.rancher.com/192.168.1.220:22223/g" `grep 'releases.rancher.com' -rl .`

 find / |grep scripts\/entry

grep 'https://releases.rancher.com/ui/latest2/index.html' -rl /

docker history rancher:v2.4-head | \
awk '{print $1}' | \
grep -v IMAGE | grep -v missing | \
tac | \
sed "s/\(.*\)/docker inspect \1 | \
jq -r \'.[0].ContainerConfig.Cmd[2] | tostring\'/" | \
sh | \
sed 's/^#(nop) //'


源码编译通过，但是卡死

直接改容器中的东西，没找到


##  安装yarn
yum install -y nodejs
sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
sudo yum install -y nodejs


安装node

https://www.cnblogs.com/zhi-leaf/p/10979629.html
https://nodejs.org/dist/latest-v10.x/
npm install -g yarn