require 'net/http'
require 'uri'
class BusReader < Consumer

  API_URI = 'http://api.com/register'.freeze

  class << self
    def consume(data)
      uri = URI.parse(API_URI)

      Net::HTTP.post_form(uri, { tag: data })
      puts data
    end
  end


end