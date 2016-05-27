require 'open-uri'

url = "http://uestc.edu.cn"

open(url) do |page|
  page_content = page.read()
  links = page_content.scan(/<a href=\"(.*?)\"/).flatten
  links.each {|link| puts url+'/'+link}
end
