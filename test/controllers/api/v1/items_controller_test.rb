require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
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
    assert_equal Item.count, json_response.count
  end

  test "index returns items with correct properties" do
    get :index, format: :json
    json_response.each do |item|
      assert item["name"]
      assert item["description"]
      assert item["unit_price"]
    end
  end

  test "show responds to json" do
    get :show, format: :json, id: 1
    assert_response :success
  end

  test "show returns correct record" do
    get :show, format: :json, id: Item.last.id
    assert_equal Item.last.id, json_response["id"]
  end

  test "show returns item with correct properties" do
    get :show, format: :json, id: Item.last.id
    assert_equal Item.last.name, json_response["name"]
    assert_equal Item.last.description, json_response["description"]
    assert_equal Item.last.unit_price, json_response["unit_price"]
  end

  test "find responds to json" do
    get :find, format: :json, id: Item.first.id
    assert_response :success
  end

  test "find returns correct record" do
    get :find, format: :json, name: Item.first.name
    assert_equal Item.first.name, json_response["name"]
  end

  test "find all responds to json" do
    get :find_all, format: :json, id: Item.first.id
    assert_response :success
  end

  test "find all returns all corresponding records" do
    get :find_all, format: :json, name: Item.first.name
    assert_equal 2, json_response.count
  end

end
