require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
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
    assert_equal InvoiceItem.count, json_response.count
  end

  test "index returns invoice_items with correct properties" do
    get :index, format: :json
    json_response.each do |invoice_item|
      assert invoice_item["unit_price"]
      assert invoice_item["quantity"]
    end
  end

  test "show responds to json" do
    get :show, format: :json, id: 1
    assert_response :success
  end

  test "show returns correct record" do
    get :show, format: :json, id: InvoiceItem.last.id
    assert_equal InvoiceItem.last.id, json_response["id"]
  end

  test "show returns invoice_item with correct properties" do
    get :show, format: :json, id: InvoiceItem.last.id
    assert_equal InvoiceItem.last.unit_price, json_response["unit_price"]
    assert_equal InvoiceItem.last.quantity, json_response["quantity"]
  end

  test "find responds to json" do
    get :find, format: :json, id: InvoiceItem.first.id
    assert_response :success
  end

  test "find returns correct record" do
    get :find, format: :json, quantity: InvoiceItem.first.quantity
    assert_equal InvoiceItem.first.quantity, json_response["quantity"]
  end

  test "find all responds to json" do
    get :find_all, format: :json, id: InvoiceItem.first.id
    assert_response :success
  end

  test "find all returns all corresponding records" do
    get :find_all, format: :json, quantity: InvoiceItem.first.quantity
    assert_equal 2, json_response.count
  end

end
