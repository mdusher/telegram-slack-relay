require 'net/http'

class Slack
  attr_accessor :url

  def initialize(url)
    self.url = url
  end

  def send(json)
    uri = URI(self.url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' => 'application/json'})
    req.body = json
    res = http.request(req)
  end
end

