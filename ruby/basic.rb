#! /usr/bin/ruby -w
# 上面的－w表示有warning要提示
#

puts $*.size #命令行参数个数，不包含.rb文件本身
puts $*[0]


puts 'hello world'

BEGIN {
    puts 'executed before program run.'
}

print <<eofff
几个注意点：
在Ruby 双引号 字符串中，井号#后面接括号{}之内的语句就是ruby语句，可以是一个局部变量，一个全局变量，也可以是一段代码!!!
eofff

$global_var = 5 #全局变量


def ppp(name = 'sss') #函数和默认参数
    @id = 3
    tmp = 4 #局部变量
    if @id > 3 then #if语句
        tmp += 10
    elsif @id == 3 then
        tmp += 5
    else
        tmp += 0
    end
    puts 'aaa' if $global_var == 5 #执行语句在前的if语句
    
    puts "Hello, #{name}, your id is #@id, global_val = #$global_var, tmp = #{tmp}." #这里必须使用双引号的字符串，才能替换掉变量
end

ppp 'dd' #函数调用


for i in 0..3
    puts "i = #{i}"
end
(0..3).each do |i|
    puts "this i = #{i}"
end

=begin 
大学里常常发生占位置的现象：头天晚上拿一本书放在课座上，表示位置已经被占了;第二天才来到这个座位上，翻开书正式上课.在这个现象中，“书本”充当了“占位符”的作用。  
在Ruby语言中，yield是占位符:先在前面的某部分代码中用yield把位置占着，然后才在后面的某个代码块(block)里真正实现它,从而完成对号入座的过程.  
#定义find
=end  
def process(str)  
    str = str + ".txt"
    yield str #用yield来处理(至于怎么处理，还不知道，占个位置先^_^)  
    str = str + ".app"
    yield str
end

#以下两种写法效果一样!!!
process("readme") { |str| puts "file name is #{str}" }  
process("readme") do |str|
	puts "file name is #{str}"
end


class Customer
    CONST_VAL = 20 #类常量
    @@total = 0 #类的静态变量，所有这个类的对象共有的
    def initialize name,age
        @name = name  #类的成员变量，不需要在外面声明的,类外部访问不到
        @age = age
        @@total += 1
    end

    def print_info
        puts "name = #@name, age = #@age"
        puts "total = #@@total"
    end
end

c1 = Customer.new('name1', 32)
C2 = Customer.new('name2', 44) #常量
c1.print_info
C2.print_info


Const_val = 100 #常量以大写字母开头
puts "id = #{@id},id = #@id, name = #@name, CONST_GGG = #{Const_val}"
puts (Time.now - 86400).strftime '%Y-%m-%d'
puts "date = #{(Time.now - 86400).strftime '%Y-%m-%d'}"

@PI = Math.acos(-1.0)
puts 3.2 % 1.5
puts "PI = #{@PI}"

@now = 0

@Cycle = 1 * 60 * 60 #seconds
@MinQPS = 5
@MaxQPS = 11

def time2QPS(time)
    x = (time - @now) % @Cycle / @Cycle * 2 * @PI
    return (Math.sin(x) + 1) / 2 * (@MaxQPS - @MinQPS) + @MinQPS
end

puts time2QPS(0).to_i
puts time2QPS(60 * 60 * 0.25).to_i
puts time2QPS(60 * 60 * 0.75).to_i
puts time2QPS(60 * 60 * 0.95).to_i


