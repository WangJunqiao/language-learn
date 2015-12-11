# module Stringify把整数转化成英文
module Stringify
  def stringify
    if @value == 10 # 需要一个实例变量value，但本身没有
      "Ten"
    else
      "Not Ten"
    end
  end

  def self.included(base) #当这个module被include的时候调用
    puts "Stringify included"
  end
end

module Math
  def add(val_one, val_two)
    BigInteger.new(val_one + val_two) #BigInteger还没定义
  end

  def self.extended(base) #当这个module被extend的时候调用
    puts "Math extended!"
  end
end

class Number #基类
  def intValue #定义value的get方法
    @value
  end
end

class BigInteger < Number

  include Stringify  #include包含进来的，算作是instance method ！！！！
  extend Math # extend进来的，算作是class method ！！！！
 
  def initialize(value)
    @value = value  #
  end
end

bigint1 = BigInteger.new(10)
puts bigint1.stringify  #调用实例方法
puts bigint1.intValue

bigint2 = BigInteger.add(3, 4) #调用类方法
puts bigint2.stringify


module MyFormatter
  def format
    "format [#{@value}]"
  end
end

bigint2.extend MyFormatter #将方法注入到单个实例中，其它实例没法调用这些方法
puts bigint2.format 
