class WelcomeController < ApplicationController
  def index
    @remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
    p "IP"
    p @remote_ip
    I18n.locale = 'en'
    @geoPage = Geomaticly.page('rvSkxbW3PdgWZwRQ')
  end
end
