#! /usr/bin/ruby -w

#不管字符串变量也好，符号变量也好，都是用来表示文本的，它们之间，也可以互相转换（通过to_sym和to_s）：
#http://blog.csdn.net/besfanfei/article/details/7966987
#相同的符号指向的对象是同一个，相同的字符串却不一定，所以映射一般是用符号的，不用字符串的
def func(num, options={})
  puts "num = #{num}"
  options.each do |key, value|
    puts %Q/#{key} ===>>> #{value}/
  end
end

func 3, :a1 => 'xixi', :a2 => 'haha', :a3 => 'kengdie'

map = {
  :beijing => 12000000,
  :shanghai => 13000000,
  :hangzhou => 4000000
}

func(1000, map)

