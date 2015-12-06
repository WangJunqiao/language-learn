#Module是一些函数和常量的集合
module MMM
  include Math #包含另一个模块可以那个模块中的实例方法和常量变成自己的

  def showMe
    puts "instance method"
  end

  def MMM.staticMethod
    puts "MMM static method"
  end
end


class AAA
  puts "begin define AAA" #ruby解释器是顺序执行下去的，这一行会打印出来，就算下面没有AAA.new

  include MMM

  CONST_VALUE = 1

  def initialize
    print "initialized\n"
    @name = 'dd'
    #@ttr = "ttr"
  end

  def name
    @name || "kong"  #如果@name=nil返回空,方法的返回值是最后一个执行的句子的值,跟bash一样
  end

  def name=(nm)
    @name = nm
  end

  def test_default device='classic' #默认参数
    print device
  end

  def test_nested # ||= 是一个操作符,表示前一个值为空就等于后面一个值
    @ttr ||= begin  #如果@ttr=nil才会等于begin end这一块的结果
               if @name == "dd"
                 "dd + e"
               else
                 "+ e";
               end
    end

  end

  puts "end of AAA definition\n\n"
end



aaa = AAA.new

puts aaa.name

puts aaa.test_default

puts aaa.test_default "ddddd"

puts aaa.test_nested

puts AAA.constants #输出AAA所有的常量
puts AAA.class  #输出AAA的类型,这里是Class
puts MMM.class  #这里是Module,大写开头的
