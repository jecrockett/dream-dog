class DogsController < ApplicationController

  def index
    api_data = Faraday.get("http://pets.vsapi01.com/api-search/by-url?url=#{params["image"]}&apikey=5c3f0bd0-ab92-4fcc-9947-ad43dfcc99ac").body
    parsed_data = JSON.parse(api_data)
    @dogs = parsed_data["images"]
  end

  def show
  end

end
