# 如何使用

## 1 进入系统环境

在 Rancher Dashboard 中找到 “Launch kubectl”。进入系统环境参考：https://www.yuque.com/gsunwu/blog/pc7rx7

## 2 找到 Hadoop

执行 kubectl get po -A， 找到目标。如下，目标名称（NAME）是 admichadoop-8sh2s ，命名空间为 hadoop-p-gntrk

``` 
> kubectl get po -A
NAMESPACE        NAME                                       READY   STATUS    RESTARTS   AGE
hadoop-p-gntrk   admichadoop-8sh2s                          1/1     Running   0          4m22s
```

## 3 进入容器 Apache Hadoop

 执行如下命令进入 Hadoop。

```
kubectl exec -it -n 命名空间 名称 /bin/bash
-it： 以交互的方式运行
-n： 指定命名空间
名称：要进入的 Hadoop 的名称

本例中，就可以执行以下命令进入 Hadoop
kubectl exec -it -n hadoop-p-gntrk   admichadoop-8sh2s  /bin/bash

实例：
> kubectl exec -it -n hadoop-p-gntrk   admichadoop-8sh2s  /bin/bash
[root@admichadoop-8sh2s hadoop-3.2.1]#
```


## 4  执行测试脚本

输入 ./rundemo 执行测试脚本。

```
[root@admichadoop-8sh2s hadoop-3.2.1]# ./rundemo
--------start run hadoop demo -------
2020-06-09 08:47:47,271 INFO impl.MetricsConfig: Loaded properties from hadoop-metrics2.properties
2020-06-09 08:47:47,367 INFO impl.MetricsSystemImpl: Scheduled Metric snapshot period at 10 second(s).
                IO_ERROR=0
...
        File Input Format Counters
                Bytes Read=123
        File Output Format Counters
                Bytes Written=23
------------result------------
1       dfsadmin
[root@admichadoop-8sh2s hadoop-3.2.1]#
```

## 5 运行成功

下面即为运行结果。

``` 
------------result------------
1       dfsadmin
```

