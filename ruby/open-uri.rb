#!/usr/bin/ruby -w

require "open-uri"


uri = "http://elssapi-smoke:8080/promo?query=lost"


def get_url(uri)
    puts "\n\nbegin #{uri}"
    begin
        now = Time.now()
        open(uri) do |http|
	          @html_response = http.read
	          #puts http.status 这个会输出两行，一个200，一行OK
	          puts http.status[0].to_i
        end
        puts Time.now() - now
        #puts @html_response
    rescue URI::InvalidURIError => e
        puts 'InvalidURIError'
        puts e.message
    rescue Errno::ECONNREFUSED => e
        puts 'ECONNREFUSED'
        puts e.message
    rescue OpenURI::HTTPError => e
        puts e.message
        if e.message == '404 Not Found' then
          puts 'ddd'
        end

    ensure
        puts 'run ensure'
    end
    puts 'After begin/end'
end

#get_url('http://elssapi-smoke:8080/sapi/search/suggest?_device_id=1&_user_pgid=1&_content_pgid=29635&region=us&language=en&treatment=control&computerguid=BCCA608CF81844DFD613411CDCEDCDBF&userid=-1&his=&whis=&term=\u{fffd}\u{fffd}??\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}\u{fffd}?')

#get_url('http://127.0.0.1:8080/xixihahaah')

#get_url('http://www.baidu.com')

get_url('http://10.20.0.40:8080/sapi/search/suggest_cache/?--%3E%3C/script%3E%3Cscript%3Ealert(7391)%3C/script%3E')

#get_url('http://elssapi2:8080/sapi/search/suggest_cache/?--%3E%3C/script%3E%3Cscript%3Ealert(7391)%3C/script%3E')
puts 'run here'

