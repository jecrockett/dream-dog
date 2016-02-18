ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'webmock'
require 'vcr'
require 'minitest-vcr'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # OmniAuth Test Config
  OmniAuth.config.test_mode = true
  twitter_hash = { 'provider' => 'twitter',
                    'uid' => '12345',
                    'info' => {
                        'name' => 'billybob',
                        'email' => 'billy@bob.com',
                        'nickname' => 'BillyTheBob',
                        'image_url' => 'http://www.showbizpizza.com/events/10th/rap/advbb/advbb_intropic.jpg'
                    },
                    'credentials' => {'token' => 12343253456,
                                      'secret' => 8917234172489014789023
                                    }
                    }

  OmniAuth.config.add_mock(:twitter, twitter_hash)

  # VCR Test Config
  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end

  MinitestVcr::Spec.configure!
end

module ActionDispatch
  class IntegrationTest
    include Capybara::DSL

    def teardown
      reset_session!
    end
  end
end
