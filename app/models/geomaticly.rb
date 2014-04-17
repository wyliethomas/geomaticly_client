# Geomaticly (beta)
# TODO: Make this a gem
#
#
# Author::    Wylie Thomas  (mailto:wylie@wyliethomas.com)
# Version::   0.0.1
# Copyright:: Copyright (c) 2014 Quadmodel7, LLC
#
# USAGE
# load your apikey in an initializer, however you prefer to do that.
# I like to make a config.yml for settings like this.
#
# In your controller
# I18n.locale = 'en'
# @geoPage = Geomaticly.page('[YOUR PAGE KEY]')
#
# In your view
# <%= @geoPage.[SOME BLOCK TITLE] %>

require 'net/http'
require 'json'
require 'ostruct'

class Geomaticly

  def self.page(key, ip)
    response = apicall(key, ip)
    blocks = {}
    for item in response
      if !item["title"].empty?
        block = {item["method"] => item["body"]}
        blocks.merge!(block)
      end
    end
    data = OpenStruct.new(blocks)
    return data
  end


  def self.apicall(key, ip)
    uri = URI.parse("http://#{APP_CONFIG['apiurl']}/api/v1/pages/#{key}?apikey=#{APP_CONFIG['geomaticly']['apikey']}&lang=#{I18n.locale}&ip=#{ip}")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    json = JSON.parse(response.body)
    return json
  end

end
