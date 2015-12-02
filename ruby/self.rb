
class A
  puts self # => A

  class << self
    puts self # => #<Class:A>
  end

  def A.ggg   # ggg 和 ddd是一样的类方法,外部可以通过类名访问
    puts "ggg, #{self}"
  end

  def self.ddd
    puts "ddd, #{self}"
  end

end


a = A.new
class << a
  puts self # => #<Class:#<A:0x007f7fcd0ab7d0>>
end

A.ggg # => ggg, A
A.ddd # => ddd, A

puts self # => main
