require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get show" do
    get :show, format: :json, id: 1
    assert_response :success
  end

end
