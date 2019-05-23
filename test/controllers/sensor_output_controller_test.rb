require 'test_helper'

class SensorOutputControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sensor_output_index_url
    assert_response :success
  end

  test "should get create" do
    get sensor_output_create_url
    assert_response :success
  end

  test "should get show" do
    get sensor_output_show_url
    assert_response :success
  end

end
