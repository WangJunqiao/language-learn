#/bin/env ruby

require 'active_support/core_ext/time'

local = Time.now
puts 'local: ', local
puts local.class

pst = local.in_time_zone('Pacific Time (US & Canada)') # name dictionary: http://doc.rubyfans.com/rails/api/v4.1.0/
puts 'pst: ', pst
puts pst.class

berlin = local.in_time_zone('Berlin')
puts 'berlin: ', berlin

puts berlin.strftime "%Y-%m-%d %H:%M:%S %z"



