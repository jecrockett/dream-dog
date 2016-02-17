class TwitterService

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.access_token = user.token
      config.access_token_secret = user.secret_token
    end
  end

  def inspiration(list)
    @client.list_timeline("jecrockett12", list, include_rts: false, count: 40)
  end

  def show_pics(user)
    @client.user_timeline(user, include_rts: false)
  end

end
