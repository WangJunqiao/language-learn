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
