class AAA
  def info
    puts "aaa"
  end
end

aaa = AAA.new
class << aaa  # class << someinstance, 给someinstance注入一些方法,仅对这个实例有效
  def say
    puts "instance method, say"
  end
end
aaa.say
# AAA.say   =>  undefined method `say'



class BBB
  def info
    puts "bbb"
  end

  class << self  #类方法, 实例引用不了
    def foo
      puts "I am #{self}"
    end
  end
end

BBB.foo
# BBB.new.foo   =>  undefined method `foo'










#-----------------Advanced-------------------
puts "\n\n-----------------Advanced------------------\n\n"
module Math
  module ClassMethods
    def calcAdd a, b
      a + b
    end
  end

  def self.included(base) #当Math被include的时候，把ClassMethods包含进去，作为base的类方法(class method)
    puts "base = #{base}"
    puts "self = #{self}"
    class << base
      include ClassMethods
    end
  end
end

class Utility
  include Math

  puts calcAdd 5, 6   #因为是类方法，所以可以直接用
end

