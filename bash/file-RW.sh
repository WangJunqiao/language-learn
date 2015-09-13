#!/bin/bash

echo 'bash begin!'  #单引号或者双引号都是字符串
echo "bash begin2!"

#读取文件内容到变量中
filecontent=`cat ./file-RW.sh`
echo $filecontent

#取得文件内容的每一行
for fileline in $filecontent 
do                        #这个do必须换行，不能接在上一行
  echo $fileline
done

#写内容到文件中
echo $filecontent > test.txt
echo $filecontent >> test-append.txt

