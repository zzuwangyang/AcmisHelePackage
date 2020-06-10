 ## 批量打包
 打开 shell ，复制以下命令并运行
find ./|grep tgz|xargs rm 
find .|awk '{if(index($0,"package.sh")>0) print $0}'|/bin/bash && ./package.sh
 
 ## 自动打包
 while true; do find ./|grep tgz|xargs rm ; find .|awk '{if(index($0,"package.sh")>0) print $0}'|/bin/bash && ./package.sh; sleep 3; done

 
 ## 删除所有 tgz
echo "删除前..." && \
find ./|grep tgz && \
find ./|grep tgz|xargs rm && \
echo "删除后..." && \
find ./|grep tgz
