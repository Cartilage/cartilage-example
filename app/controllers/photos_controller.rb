require 'net/http'

class PhotosController < ApplicationController

  respond_to :json

  def index
    tags = params[:tags].to_s.split(/(\,|\s)/).map { |tag| tag.present? ? tag : nil }.compact

    # TODO: We wouldn't normally otherwise do this, but we're testing for now.
    #       Should also cache api calls at regular intervals
    http = ::Net::HTTP.new('api.flickr.com')
    http.open_timeout = 15
    http.read_timeout = 30 

    tagQuery = "tags=#{tags.join(',')}" if tags.present?
    logger.info(tagQuery)
    response = http.get("/services/feeds/photos_public.gne?format=json&#{tagQuery}")

    # oh well...
    response.body.gsub!("jsonFlickrFeed({", "{")
    response.body.gsub!("})", "}")
    json = JSON.parse(response.body)

    photos = []
    json['items'].to_a.each_with_index do |item, idx|
      item['id'] = idx + 1
      photos << item
    end

    return render :json => photos.to_json
  end
end
