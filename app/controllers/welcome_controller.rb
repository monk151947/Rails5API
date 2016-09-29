class WelcomeController < ApplicationController
  require 'net/http'

  def index
    if params[:zipcode1] && params[:zipcode2]
      url = "https://www.zipcodeapi.com/rest/#{APP_CONFIG["API"]["key"]}/distance.json/#{params[:zipcode1]}/#{params[:zipcode2]}/km"
      result = Net::HTTP.get(URI.parse(url))
      @data = JSON.parse(result)
    end
  end
end
