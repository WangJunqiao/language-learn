require 'active_support/all' #必须加上/all，不然没用

class AAA
  def say
    puts "say"
  end
  alias_method :say_ya, :say #普通的函数别名功能
end
AAA.new.say_ya



class BBB
  def say
    puts "say"
  end

  def say_with_logging
    puts "\nlogging BBB"
    say_without_logging
  end

  alias_method :say_without_logging, :say
  alias_method :say, :say_with_logging
end

BBB.new.say


class CCC
  def say
    puts "say"
  end

  def say_with_logging
    puts "\nlogging, CCC"
    say_without_logging
  end

  alias_method_chain :say, :logging
end

CCC.new.say
