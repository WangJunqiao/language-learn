#!/bin/bash

echo 'bash begin!'  #单引号或者双引号都是字符串
echo "bash begin2!"

a=0   #变量赋值等号之间 不能有空格！！！

echo $a


x=2
y=3

((z = $x * $y))   #z=6
z=$((x + y))      #z=5

z=$[x + 1]        #z=3

z=`expr $x + 5`   #z=7

let z=x+5         #z=7  let句子不能有空格
let z=$x+5        #z=7  let句子不能有空格

# 虽然Bash shell 有四种算术运算方法，但并不是每一种都是跨平台的，建议使用expr。
