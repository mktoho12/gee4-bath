require 'test_helper'

class SensorOutputControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sensor_outputs_url
    assert_response :success
  end

  test "should post create" do
    post sensor_output_url, params: [{ ba: 100, a1: 200 }], as: :json
    assert_response :success
  end

  test "should get show" do
    get sensor_outputs_url(date: '20200401')
    assert_response :success
  end

end
