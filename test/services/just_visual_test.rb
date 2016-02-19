require 'test_helper'

class JustVisualTest < ActiveSupport::TestCase

  def test_just_visual_response
    VCR.use_cassette("just_visual") do
      api_data = Faraday.get("http://pets.vsapi01.com/api-search/by-url?url=https://pbs.twimg.com/media/CatUtjMW8AAq5NS.jpg&apikey=#{ENV['JUST_VISUAL_KEY']}").body
      parsed_data = JSON.parse(api_data)

      pet_format = parsed_data["images"].first

      refute pet_format.nil?
      assert pet_format.keys.include?('petName')
    end
  end

end
