#! /usr/bin/ruby -w

puts "input your name:"

name = gets    # 读取标准输入的一行, 包含换行符的
name = name.chomp # 删掉最后的换行符
puts "Hello," + name + "\n"  
print "Hello," + name + "\n"  
printf("Hello, %s, D\n",name)     # Normal output  
printf("Hello, %6s, D\n",name)    # Right align  
printf("Hello, %-6s, D\n",name)   # Left align  





# 文件写入
file = File.new "aaa.txt", "w"
file.puts "first line"
file.puts "hello #{name}"
file.close

# 文件读取
file = File.open "aaa.txt", "r"
file.each { |line|
  puts line 
}






