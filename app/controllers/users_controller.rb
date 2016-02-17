class UsersController < ApplicationController
  before_action :authorize!, only: [:show]
  def show
    @user = current_user
  end

end
