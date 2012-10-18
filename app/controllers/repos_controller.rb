require 'net/http'

class ReposController < ApplicationController

  respond_to :json

  def show
    # TODO: Simple memory caching so we don't source a lot of calls to 
    #       the search API and get rate limited.  net-http is ugly, but 
    #       it'll do for now
    repo = Rails.cache.fetch('repos', :expires_in => 1.hour) {
      http = ::Net::HTTP.new('api.github.com', 443)
      http.use_ssl = true
      http.open_timeout = 15
      http.read_timeout = 30 

      response = http.get("/repos/documentcloud/backbone")
      JSON.parse(response.body)
    }
    return render :json => repo
  end
end
