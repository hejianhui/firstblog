require 'rest-client'
class DoubanSpider
  attr_accessor :json, :source_url, :method, :content

  def initialize args={}
    self.source_url = args[:source_url]
    self.method = args[:method] || :get
    self.json = {}
  end

  def parse
    self.content = RestClient.public_send(self.method, self.source_url)
    self.json = JSON.parse(self.content)
  end

  def to_h
    self.json
  end

end

### Example
# spider = DoubanSpider.new source_url: 'xxxx'
# spider.parse
# spider.to_h
