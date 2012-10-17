require 'net/http'

class TweetsController < ApplicationController

  respond_to :json

  def index
    # TODO: Simple memory caching so we don't source a lot of calls to 
    #       the search API and get rate limited.  net-http is ugly, but 
    #       it'll do for now
    tweets = Rails.cache.fetch('tweets', :expires_in => 1.hour) {
      http = ::Net::HTTP.new('search.twitter.com')
      http.open_timeout = 15
      http.read_timeout = 30 

      response = http.get("/search.json?q=backbonejs")
      JSON.parse(response.body)['results']
    }
    return render :json => tweets
  end
end
