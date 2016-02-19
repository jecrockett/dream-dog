class PetsController < ApplicationController

  def index
    api_data = Faraday.get("http://pets.vsapi01.com/api-search/by-url?url=#{params["image"]}&apikey=#{ENV['JUST_VISUAL_KEY']}").body
    parsed_data = JSON.parse(api_data)
    @pets = parsed_data["images"]
    @new_pet = Pet.new
  end

  def show
  end

  def create
    @pet = Pet.find_or_create_from_auth(params)
    current_user.pets << @pet
    flash[:success] = "#{@pet.name} saved."
    redirect_to dashboard_path
  end
end
