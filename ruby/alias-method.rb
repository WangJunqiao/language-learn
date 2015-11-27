
class AAA
  def say
    puts "I'm AAA instance."
  end
  alias_method :say_ya, :say #普通的函数别名功能
end

AAA.new.say_ya



class BBB
  def salute
    puts "salute!!!"
  end

  def salute_with_log
    puts "Calling method..."
    salute_without_log
    puts "...Method called"
  end

  alias_method :salute_without_log, :salute
  alias_method :salute, :salute_with_log
  # alias_method_chain :salute, :log #这一句相当于上面的两句,但是需要activesupport，不知道为什么搞不起来
end

BBB.new.salute
# 进过上面的已改动，外部调用salute的函数不用变，但是内部已经加了log功能！！！
