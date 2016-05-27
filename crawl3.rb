require 'rubygems'
require 'mechanize'
agent = Mechanize.new
page = agent.get('https://www.zhihu.com/question/38270275')

puts page.links
#text = table.inner_text
#puts text
