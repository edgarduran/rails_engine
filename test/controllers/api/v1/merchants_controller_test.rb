require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
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
    assert_equal Merchant.count, json_response.count
  end

  test "index returns items with correct properties" do
    get :index, format: :json
    json_response.each do |merchant|
      assert merchant["name"]
    end
  end

  test "show responds to json" do
    get :show, format: :json, id: 1
    assert_response :success
  end

  test "show returns correct record" do
    get :show, format: :json, id: Merchant.last.id
    assert_equal Merchant.last.id, json_response["id"]
  end

  test "show returns item with correct properties" do
    get :show, format: :json, id: Merchant.last.id
    assert_equal Merchant.last.name, json_response["name"]
  end

  test "find responds to json" do
    get :find, format: :json, id: Merchant.first.id
    assert_response :success
  end

  test "find returns correct record" do
    get :find, format: :json, name: Merchant.first.name
    assert_equal Merchant.first.name, json_response["name"]
  end

  test "find all responds to json" do
    get :find_all, format: :json, id: Merchant.first.id
    assert_response :success
  end

  test "find all returns all corresponding records" do
    get :find_all, format: :json, name: Merchant.first.name
    assert_equal 2, json_response.count
  end

end
