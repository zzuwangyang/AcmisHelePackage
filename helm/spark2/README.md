# 如何运行
## 1 进入 Hadoop Spark
通过 kubectl 进入 Hadoop Spark 环境。进入系统环境参考：https://www.yuque.com/gsunwu/blog/pc7rx7

## 2 执行测试命令
执行下面命令即可测试。
``` 
# 进入工作目录 spark-3.0.0-preview2-bin-hadoop2.7
cd spark-3.0.0-preview2-bin-hadoop2.7

# 执行 python 解析器 pyspark
./bin/pyspark 

# 统计文件 README.md 行数的例子
textFile = spark.read.text("README.md")
textFile.count()
```