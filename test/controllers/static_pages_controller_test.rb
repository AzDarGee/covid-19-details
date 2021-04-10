require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should return array" do
    summaryURL = 'https://api.covid19api.com/summary'
    get summaryURL
    puts summaryURL
    assert_response :success
  end

end
