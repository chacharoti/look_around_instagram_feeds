class String
  def valid_float?
    !!Float(self) rescue false
  end
end