require 'rails_helper'

describe "Instagram" do
  def look_around 
    Instagram.new("42", "2.9", "1000").media_search
  end

  it "respone with 200 status-code" do
    response = look_around
    expect(response['meta']['code']).to eq(200)
  end

  it "respone with list of news feeds" do
    response = look_around
    expect(response['data']).not_to be_empty
  end
end