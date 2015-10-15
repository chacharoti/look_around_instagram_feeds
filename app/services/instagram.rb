class Instagram
  include HTTParty
  base_uri 'https://api.instagram.com'

  def initialize(latitude, longitude, radius)
    @options = { query: { lat: latitude, 
                          lng: longitude, 
                          distance: radius,
                          access_token: ENV['INSTAGRAM_ACCESS_TOKEN'] } }
  end

  def media_search
    self.class.get("/v1/media/search", @options)
  end
end