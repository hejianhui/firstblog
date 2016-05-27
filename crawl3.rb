require 'rubygems'
require 'mechanize'
agent = Mechanize.new
page = agent.get('https://www.zhihu.com/question/38270275')

table = page.search('a')
text = table.inner_text
puts text
