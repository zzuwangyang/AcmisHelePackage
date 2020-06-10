 ## 批量打包
 打开 shell ，复制以下命令并运行
 > find .|awk '{if(index($0,"package.sh")>0) print $0}'|/bin/bash && ./package.sh
