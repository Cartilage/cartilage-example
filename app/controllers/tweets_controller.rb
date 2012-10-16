require 'net/http'

class TweetsController < ApplicationController

  respond_to :json

  def index
    # TODO: We wouldn't normally otherwise do this, but we're testing for now.
    #       Should also cache api calls at regular intervals
    http = ::Net::HTTP.new('search.twitter.com')
    http.open_timeout = 15
    http.read_timeout = 30 

    response = http.get("/search.json?q=backbonejs")
    tweets = JSON.parse(response.body)

    return render :json => tweets['results']
  end
end
