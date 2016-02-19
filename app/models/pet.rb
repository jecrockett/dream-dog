class Pet < ActiveRecord::Base
  has_many :pets_users
  has_many :users, through: :pets_users

  def self.find_or_create_from_auth(pet_info)
    pet = Pet.find_or_create_by(ad_url: pet_info['ad_url'])

    pet.name = pet_info['name']
    pet.image_url = pet_info['image_url']
    pet.description = pet_info['description']

    pet.save
    pet
  end
end
