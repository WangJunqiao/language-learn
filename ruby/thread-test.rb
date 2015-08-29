#! /usr/bin/ruby -w
require "thread"

Thread.abort_on_exception = true

t1 = Thread.new do
	puts 'In new Thread'
	Thread.current[:name] = 'AAA'
#	raise "exception from thread."
end

sleep 2

puts 'not reached'

puts t1[:name]

