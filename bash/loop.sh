#!/bin/bash

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done


a=0
while [ $a \< 5 ]; do
    echo $a
    a=$((a + 1))
done


echo ''
a=0
while : ; do #无限循环
    a=$((a + 1))
    if [[ $a < 2 ]]; then continue; fi;
    echo $a
    if [[ $a > 3 ]]; then break; fi;
done



echo ''
a=0
until [[ $a > 3 ]]; do
    echo $a
    a=`expr $a + 1`
done



echo '输入 1 到 4 之间的数字:'
read aNum
case $aNum in
    1)  echo '你选择了 1'
    ;;
    2)  echo '你选择了 2'
    ;;
    3)  echo '你选择了 3'
    ;;
    4)  echo '你选择了 4'
    ;;
    *)  echo '你没有输入 1 到 4 之间的数字'
    ;;
esac

