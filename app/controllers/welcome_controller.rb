class WelcomeController < ApplicationController
  def index
    ip = request.env["HTTP_X_FORWARDED_FOR"]
    p "IP"
    if ip.nil?
      ip = "64.147.131.201"
      #ip = '187.185.71.90'; #mexico
      #ip = '200.85.39.10'; #paraguay
      #ip = '63.245.26.14'; #nicaragua
    end
    p ip
    I18n.locale = params[:lang]
    @geoPage = Geomaticly.page('hjPZmnemNgEXZqOf', ip)
    p "PAGE"
    p @geoPage
  end
end
