class InstagramController < ApplicationController

  def look_around
    instagram = Instagram.new( latitude, longitude, radius )

    if instagram.instance_values.present?
      data_response = instagram.media_search
      @news_feeds = JSON.parse(data_response.body)['data']

    else
      @error = 'Your latitude, longitude or radius are not valid. Please check'
    end
  end

  private

  def latitude
    params['latitude']
  end

  def longitude
    params['longitude']
  end

  def radius
    params['radius']
  end
end