class WelcomeController < ApplicationController
  def index
    @geoPage = Geomaticly.getPage
  end
end
