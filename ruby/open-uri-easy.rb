require 'net/http'
Net::HTTP.get('example.com', '/index.html') # => String
