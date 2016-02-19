class TweetsController < ApplicationController

  def new
    @tweet = "Your Tweet"
    @value = "Please help save this pet! #{params["ad"]}"
  end

  def create
    TwitterService.new(current_user).tweet(params["Your Tweet"]["content"])
    redirect_to dashboard_path
  end
end
