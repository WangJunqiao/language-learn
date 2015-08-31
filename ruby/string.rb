#! /usr/bin/ruby -w

@name = 'dd'

puts 'hello\nworld' #单引号为纯字符串，不考虑任何转义字符
puts "hello\nworld, #{@name}" #考虑转义字符和替换

# %Q相当于双引号字符串，不同的是不需要太多的转义字符
# (...)也可用其他非数字字母的符号或成对的符号代替, 诸如[...], !...!, +...+,{...}, <...>等.
puts %Q("hello", #{@name}. 引号不需要转义,这两个字符\\\)还是要转义的！) 
# %q跟%Q差不多，但是不进行替换
puts %q("hello", #{@name}. 引号不需要转义,这两个字符\\\)还是要转义的！) 

puts %q= haha jjjjj=
puts %q&jjjjjj haha&
puts %q'"hello world ---\''


# 转化成数组，有替换效果
puts %W("#{@name} bar)
# 转化成数组，无替换效果
puts %w("#{@name} bar)

#执行shell语句，并返回结果
puts %x(ls -alh)

#正则表达式
puts %r(/home/#{@name})

#信号
puts %s(foo ttt)


str = 'test sub-string'
puts str['abc']
puts str['te']
str['test'] = 'hello'
puts str

puts 'replace numbers: %d, %.2f' % [33, 44.925]

a = "hello there"
puts a[/[aeiou](.)\1/, 1]   #=> "l"
puts a[/o/]
