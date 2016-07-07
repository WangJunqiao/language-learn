class AAA
  def self.foo_a # 类方法, 但是实例是不能调用的
    puts 'class method'
  end

  class << self #把这一块的内容添加到self也就是类AAA里面
    def foo # foo跟foo_a地位是一模一样的
      puts 'inner foo'
    end
  end

  def mmm
    puts 'instance method'
  end
end

AAA.foo_a
AAA.foo

AAA.new.mmm

# AAA.new.foo_a          #`<main>': undefined method `foo_a' for #<AAA:0x007fd89a90d718> (NoMethodError)
# AAA.new.foo            #`<main>': undefined method `foo' for #<AAA:0x007f91498cd7a0> (NoMethodError)
# AAA.mmm                #`<main>': undefined method `mmm' for AAA:Class (NoMethodError)
