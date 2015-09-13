#! /usr/bin/ruby -w


for i in 0..3 do
  puts "[for in do] i = #{i}"
end


(0..3).each do |i|
  puts "[each do] this i = #{i}"
end


@x = 0
while @x < 3 do
  puts "[while do] x = #@x"
  @x += 1
end


@x = 10
until @x < 7 do
  puts "[until do] x = #@x"
  @x -= 1
end


