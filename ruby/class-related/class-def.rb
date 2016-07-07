
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

