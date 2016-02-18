require 'test_helper'

class UserCanLoginViaTwitterTest < ActionDispatch::IntegrationTest

  def setup
    OmniAuth.config.mock_auth[:twitter]
  end

  test "Visitor can log in via twitter" do
    visit root_path
    click_on "Login with Twitter"

    assert dashboard_path, current_path
    within '.dashboard-content' do
      assert page.has_content? "billybob"
    end
  end
end


# VCR.use_casette('name of cassette') do
#  normal test syntax
#end


#caseette itself gets created automatically. hits the api if it can't find the yml file you specified, otherwise pulls from that saved return.
#
