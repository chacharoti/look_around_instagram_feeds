class Instagram 
  include HTTParty
  base_uri 'https://api.instagram.com'

  def initialize(latitude, longitude, radius)    
    if  check_valid_of? latitude, longitude, radius
      @options = { query: { lat: latitude, 
                            lng: longitude, 
                            distance: radius,
                            access_token:'283645197.1677ed0.6923736226ef4598b332b890f8194956' } }
    end
  end

  def media_search
    self.class.get("/v1/media/search", @options)
  end

  def check_valid_of? latitude, longitude, radius
    if  latitude.valid_float? &&
        latitude.to_f.between?( -90, 90 ) &&
        longitude.valid_float? &&
        longitude.to_f.between?( -180, 180 ) &&
        radius.valid_float? &&
        radius.to_f.between?( 1, 5000 ) 
      return true
    else 
      return false
    end
  end
end