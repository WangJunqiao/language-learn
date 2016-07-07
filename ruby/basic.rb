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


Const_val = 100 #常量以大写字母开头
Const_val = 50
puts "id = #{@id},id = #@id, name = #@name, CONST_GGG = #{Const_val}"
puts (Time.now - 86400).strftime '%Y-%m-%d'
puts "date = #{(Time.now - 86400).strftime '%Y-%m-%d'}"

@PI = Math.acos(-1.0)
puts "PI = #{@PI}"

puts 3.2 % 1.5 # 0.2 实数取余

puts 'hello'.start_with? 'he'      #以?结尾的方法，返回bool值
puts 'hello'.start_with? 'st', 'dd'

puts 'strip! - ', 'hello'.strip! 
puts 'strip  - ' + 'hello'.strip
