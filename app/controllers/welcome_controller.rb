class WelcomeController < ApplicationController
  def index
    I18n.locale = 'en'
    @geoPage = Geomaticly.page('rvSkxbW3PdgWZwRQ')
  end
end
