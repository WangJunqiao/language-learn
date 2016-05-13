=begin 
大学里常常发生占位置的现象：头天晚上拿一本书放在课座上，表示位置已经被占了;第二天才来到这个座位上，翻开书正式上课.在这个现象中，“书本”充当了“占位符”的作用。 
在Ruby语言中，yield是占位符:先在前面的某部分代码中用yield把位置占着，然后才在后面的某个代码块(block)里真正实现它,从而完成对号入座的过程. 
#定义find
=end 
def process(arg) 
  yield arg + '.txt' #用yield来处理(至于怎么处理，还不知道，占个位置先^_^) 
  yield arg + '.app'
end

#以下两种写法效果一样!!!
process("readme") { |str| 
  puts "file name is #{str}" 
}
process("readme") do |str|
	puts "file name is #{str}"
end
