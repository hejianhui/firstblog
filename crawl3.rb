require 'rubygems'
require 'mechanize'
agent = Mechanize.new
page = agent.get('http://zhihu.com')

table = page.search('a')
text = table.inner_text
puts text
