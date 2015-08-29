#! /usr/bin/ruby -w
puts 'hello\nworld' #单引号为纯字符串，不考虑任何转义字符
puts "hello\nworld" #考虑转义字符

aaa = 'dd'
puts %w(Hello,#{aaa}) #%w相当于单引号
puts %W(Hello,#{aaa}) 


str = 'test sub-string'
puts str['abc']
puts str['te']
str['test'] = 'hello'
puts str

puts 'replace numbers: %d, %.2f' % [33, 44.925]

a = "hello there"
puts a[/[aeiou](.)\1/, 1]   #=> "l"
puts a[/o/]
