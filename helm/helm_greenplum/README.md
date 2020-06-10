# 如何运行
## 1 进入系统环境
进入 Greenplum 环境。

## 2 运行系统
执行命令  su gpadmin -l -c "/entrypoint.sh" 运行系统，执行结果如下所示。
```  
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
```
