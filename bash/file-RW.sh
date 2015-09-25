#!/bin/bash
echo 'bash begin!'  #单引号或者双引号都是字符串

#方法一，指定换行符读取,这种方法会把空行忽略掉的！！！！
IFS="
"
for LINE in `cat ./file-RW.sh`; do echo $LINE; done

#方法二，文件重定向给read处理：
cat ./file-RW.sh | while read LINE; do echo $LINE; done

#方法三，用read读取文件重定向：
while read LINE; do echo $LINE; done <./file-RW.sh


