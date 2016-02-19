class User < ActiveRecord::Base
  has_many :pets_users
  has_many :pets, through: :pets_users

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth['uid'], provider: auth['provider'])

    user.nickname = auth['info']['nickname']
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.image_url = auth['info']['image']
    user.token = auth['credentials']['token']
    user.secret_token = auth['credentials']['secret']

    user.save
    user
  end
end
