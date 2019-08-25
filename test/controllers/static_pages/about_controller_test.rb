require 'test_helper'

class StaticPages::AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get author" do
    get static_pages_about_author_url
    assert_response :success
  end

end
