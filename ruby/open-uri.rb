#!/usr/bin/ruby -w

require "open-uri"


uri = "http://elssapi-smoke:8080/promo?query=lost"
html_response = nil

now = Time.now()

open(uri) do |http|
	html_response = http.read
	puts http.status
	puts http.status[0].to_i
end

puts Time.now() - now

puts html_response

