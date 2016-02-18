class PetsController < ApplicationController

  def index
    api_data = Faraday.get("http://pets.vsapi01.com/api-search/by-url?url=#{params["image"]}&apikey=#{ENV['JUST_VISUAL_KEY']}").body
    parsed_data = JSON.parse(api_data)
    @pets = parsed_data["images"]
  end

  def show
  end

end
