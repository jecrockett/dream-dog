class FeedsController < ApplicationController

  def show
    @twitter = TwitterService.new(current_user)
  end

end
