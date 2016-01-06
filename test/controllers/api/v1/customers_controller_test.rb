require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index returns array of records" do
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test "index returns correct number records" do
    get :index, format: :json
    assert_equal Customer.count, json_response.count
  end

  test "index returns customers with correct properties" do
    get :index, format: :json
    json_response.each do |customer|
      assert customer["first_name"]
      assert customer["last_name"]
    end
  end

  test "show responds to json" do
    get :show, format: :json, id: 1
    assert_response :success
  end

  test "show returns correct record" do
    get :show, format: :json, id: Customer.last.id
    assert_equal Customer.last.id, json_response["id"]
  end

  test "show returns customer with correct properties" do
    get :show, format: :json, id: Customer.last.id
    assert_equal Customer.last.first_name, json_response["first_name"]
    assert_equal Customer.last.last_name, json_response["last_name"]
  end

  test "find responds to json" do
    get :find, format: :json, id: Customer.first.id
    assert_response :success
  end

  test "find returns correct record" do
    get :find, format: :json, first_name: Customer.first.first_name
    assert_equal Customer.first.first_name, json_response["first_name"]
  end

  test "find all responds to json" do
    get :find_all, format: :json, id: Customer.first.id
    assert_response :success
  end

  test "find all returns all corresponding records" do
    get :find_all, format: :json, first_name: Customer.first.first_name
    assert_equal 2, json_response.count
  end

end
