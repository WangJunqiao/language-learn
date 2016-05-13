#! /usr/bin/ruby -w
# 上面的－w表示有warning要提示
#

puts $*.size #命令行参数个数，不包含.rb文件本身
puts $*[0]  #第一个参数，依次类推


puts 'hello world'

BEGIN {
  puts 'executed before program run.'
}

print <<SQL
这是一个多行的字符串,
可以直接换行的
SQL

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


class Customer
  CONST_VAL = 20 #类常量
  @@total = 0 #类的静态变量，所有这个类的对象共有的
  def initialize name,age
    @name = name #类的成员变量，不需要在外面声明的,类外部访问不到
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
Const_val = 50
puts "id = #{@id},id = #@id, name = #@name, CONST_GGG = #{Const_val}"
puts (Time.now - 86400).strftime '%Y-%m-%d'
puts "date = #{(Time.now - 86400).strftime '%Y-%m-%d'}"

@PI = Math.acos(-1.0)
puts "PI = #{@PI}"

puts 3.2 % 1.5 # 0.2 实数取余

