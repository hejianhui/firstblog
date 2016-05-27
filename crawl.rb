require "open-uri" 
require "nokogiri"

html = open("http://douban.com/").read
doc = Nokogiri::HTML(html)
ans = []

doc.search('img').each do |i|
  ans << i.attr('src')
end

temp_ans = ans.map do
  |url| url.match(/^http/) ? url : "http://douban.com/#{url}"
end

temp_ans.each do |full_url|
  `wget #{full_url}`
end

