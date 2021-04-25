require "test_helper"
require "net/http"
require "json"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should return array" do
    summaryURL = URI('https://api.covid19api.com/summary')
    summary = JSON.parse(Net::HTTP.get(summaryURL))
    puts summaryURL
    assert_response :success
  end

end
