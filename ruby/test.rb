#! /usr/bin/ruby -w

puts $*.size
puts $*[0]

@a = 0
@b = 15

while @a < 5 do
    until @b > 20 do
        puts "#@a, #@b"
        @b += 1
    end
    
    @a += 1
end

