#! /usr/bin/ruby -w

def func(num, options={})
  puts "num = #{num}"
  options.each do |key, value|
    puts %Q/#{key} ===>>> #{value}/
  end
end

func 3, :a1 => 'xixi', :a2 => 'haha', :a3 => 'kengdie'

map = {
  :beijing => 12000000,
  :shanghai => 13000000,
  :hangzhou => 4000000
}

func(1000, map)

