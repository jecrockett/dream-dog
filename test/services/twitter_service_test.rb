require 'test_helper'

class TwitterServiceTest < ActiveSupport::TestCase

  def test_inspiration_feed
    VCR.use_cassette("inspiration") do
      carl = users(:carl)
      @twitter = TwitterService.new(carl)
      response = @twitter.inspiration("doggy-inspiration")
      tweet = response.first

      refute response.nil?
      assert tweet.to_h.keys.include?(:entities)
    end
  end

end
