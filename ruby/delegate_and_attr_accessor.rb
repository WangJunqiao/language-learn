require 'active_support/all'


class Queue

  def initialize
    @buf = Array.new
  end

  def size
    @buf.length
  end

  def put value
    @buf << value
  end
end


class MyQueue
  #attr_reader :queue  #相当于生成了一个method:  def queue \ @queue \ end
  #attr_writer :queue  #相当于生成了一个method:  def queue=(q) \ @queue = q \ end

  attr_accessor :queue  #相当于上面的两个

  delegate :size, :put, :to => :queue    #把MyQueue的size, put方法代理到queue上去
end


q = MyQueue.new
q.queue = Queue.new

puts q.size

q.put 333

puts q.size




