require 'net/http'
require 'json'
require 'ostruct'

class Geomaticly


  def testobj
    item1 = {:headline => "this is the headline", :phone => "111-111-1111"}
    blob = OpenStruct.new(item1)
    #obj = test.testobj.name
    return blob
  end

  #creates a page object containing all the blocks for this page.
  def self.page
    response = apicall
    blocks = {}
    for item in response
      if !item["title"].empty?
        block = {item["title"] => item["body"]}
        blocks.merge!(block)
      end
    end
    blob = OpenStruct.new(blocks)
    return blob
  end


  def self.apicall
    #TODO: add api key to URL for security
    #TODO: add geo and lang to URL params?
    uri = URI.parse("http://127.0.0.1:3001/api/v1/pages/4?apikey=1234&lang=en&country=us&state=ut")
    #uri = URI.parse("http://127.0.0.1:3001/api/v1/pages/4")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    json = JSON.parse(response.body)
    return json
  end

end
