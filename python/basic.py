# this is comment mark
import sys

def foo(debug = True):    #函数定义，默认参数
    "this is a document of foo"
    return True
foo()

i = int(raw_input('input a integer: ')) # input
print 'the square value is : %d' % (i * i)

print 'integer: %d, my name is %s\n' % (10, 'dd') #printf format


print 'cube 2: %d' % (2 ** 3)    #pow
print 1 << 6 #bitwise operators
print 1 & 3 #
print 1 ^ 2 #

print 1 or (not 1) and 0 #logic operators

str = 'python'
print str * 3 # 
# str[3] = '3' 错误！string是不能修改的
print str[0]
print str[0 : 2] #[start, end)
print str[1 : ]

aTuple = (0, '343', 92)
# aTuple[0] = 9  can't be changed
print aTuple

aList = [0, 1, 2, 3, 4]
aList[2] = 20 # can be modified
print aList[0]
print aList[1 : 3]
print aList[2 : ]


aDict = {'host' : 'rudy'} #create dictionary
aDict['manager'] = 'zoufei' #add a key
aDict['boss'] = 5
for key in aDict:
    print key, aDict[key]


cnt = 0;
while cnt < 4 :
    print 'cnt = ', cnt
    cnt += 1

print 3, #add a comma to avoid auto-generated \n
print 4,
print 5

