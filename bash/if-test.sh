#!/bin/bash

echo 'if clause and condition test!'

:<<eof  #这是区块注释
test 用法：test var1 option var2. option有以下几种
-eq 等于则为真
-ne 不等于则为真
-gt 大于则为真
-ge 大于等于则为真
-lt 小于则为真
-le 小于等于则为真
eof


a=3
b=4

if test $a -eq $b  #标准写法
then
    echo a=b
else
    echo a!=b
fi

if test $a -eq $b; then 
    echo a=b
else
    echo a!=b
fi

if test $a -eq $b; then echo a=b; else echo a!=b; fi    #写成一行，bash里面分号等于换行的效果

:<<eof
文件测试
参数    说明
-e 文件名   如果文件存在则为真
-r 文件名   如果文件存在且可读则为真
-w 文件名   如果文件存在且可写则为真
-x 文件名   如果文件存在且可执行则为真
-s 文件名   如果文件存在且至少有一个字符则为真
-d 文件名   如果文件存在且为目录则为真
-f 文件名   如果文件存在且为普通文件则为真
-c 文件名   如果文件存在且为字符型特殊文件则为真
-b 文件名   如果文件存在且为块特殊文件则为真
eof

if test -e ./aaa/bbb/ccc.txt; then
    echo './aaa/bbb/ccc.txt exists'
else
    mkdir -p ./aaa/bbb
    touch ./aaa/bbb/ccc.txt
    echo 'create file ./aaa/bbb/ccc.txt'
fi

:<<eof
2) 内建命令[与test命令等价，把参数作为比较表达式和文件测试，true返回0，false返回1。
注意：[ 数字 ]、[ 字符串 ]都为真，NULL（空状态）、未未定义（或者叫为初始化的变量）、初始化但赋值为null的变量为假

3) bash2.02以后支持[[..]]关键字，比[]结构更加通用
在[[]]之间所有的字符都不会发生文件名扩展或者单词分割，但是会发生参数扩展和命令替换；使用[[]]能防止脚本中的很多逻辑错误，比如 &&， ||， <， >操作符能正常存在于[[]]中，如果出现在[]中会报错。
eof

a='123'
b=5

#条件判断语句 test 或者 [] 里面不能出现>和<,因为他们是重定向文件流用的
#if [ $b > 5 ]; then echo 555; fi; #这种写法是错的，会在当前目录生成一个名为“5”的文件！！！
if [ $b -ge 5 ]; then echo 666; fi; #这样才是对的

#if [ $a > $b ]; then echo 333; fi; #跟上面一样，也是错误的写法。也会在当前目录生成一个名为 $b(具体到这里就是5)的文件！！！
if [[ $b > 4 ]]; then echo 777; fi; #这样就是对的，双中括号不会解释成文件流重定向


if [[ $a == "123" && $b > 5 ]]; then 
    echo "True"
else
    echo "False"
fi

#总结起来,[]的使用很危险，存在各种可能的扩展.都用[[ 。。。 ]]就妥妥的了。
