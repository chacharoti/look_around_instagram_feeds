class InstagramController < ApplicationController

  def look_around
    instagram_request = Instagram.new( latitude, longitude )
    result = instagram_request.media_search
    @news_feeds = JSON.parse(result.body)['data']
  end

  private

  def latitude
    params.require(:latitude)
  end

  def longitude
    params.require(:longitude)
  end
end