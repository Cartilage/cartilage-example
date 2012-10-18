require 'feedzirra'

#
# Use the Yahoo! Weather API
# http://developer.yahoo.com/weather/
#
class ForecastController < ApplicationController

  respond_to :json

  def show
    woeid = params[:id]
    if woeid.present?
      weather = Feedzirra::Feed.fetch_and_parse("http://weather.yahooapis.com/forecastrss?w=#{woeid}").to_json
      weather['id'] = woeid

      return render :json => weather
    else
      return :status => :bad_request, :nothing => true
    end
  end
end
