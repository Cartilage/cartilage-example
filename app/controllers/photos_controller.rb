require 'net/http'

class PhotosController < ApplicationController

  respond_to :json

  def index
    tags = params[:tags].to_s.split(/(\,|\s)/).map { |tag| tag.present? ? tag : nil }.compact
    tags = %w(austin skyline) if tags.length == 0

    # TODO: We wouldn't normally otherwise do this, but we're testing for now.
    #       Should also cache api calls at regular intervals
    http = ::Net::HTTP.new('api.flickr.com')
    http.open_timeout = 15
    http.read_timeout = 30 

    tag_query = "tags=#{tags.join(',')}"
    response = http.get("/services/feeds/photos_public.gne?format=json&#{tag_query}")

    # oh well...
    response.body.gsub!("jsonFlickrFeed({", "{")
    response.body.gsub!("})", "}")
    json = JSON.parse(response.body)

    photos = []
    json['items'].to_a.each_with_index do |item, idx|
      item['id'] = idx + 1
      photos << item
    end

    render :json => photos.to_json
  end
end
