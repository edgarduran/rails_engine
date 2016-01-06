require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index returns array of records" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test "index returns correct number records" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :index, format: :json
    assert_equal Invoice.count, json_response.count
  end

  test "index returns invoicess with correct properties" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :index, format: :json
    json_response.each do |invoices|
      assert invoices["status"]
    end
  end

  test "show responds to json" do
    get :show, format: :json, id: 1
    assert_response :success
  end

  test "show returns correct record" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :show, format: :json, id: Invoice.last.id
    assert_equal Invoice.last.id, json_response["id"]
  end

  test "show returns invoices with correct properties" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :show, format: :json, id: Invoice.last.id
    assert_equal Invoice.last.status, json_response["status"]
  end

  test "find responds to json" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :find, format: :json, id: Invoice.first.id
    assert_response :success
  end

  test "find returns correct record" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :find, format: :json, status: Invoice.first.status
    assert_equal Invoice.first.status, json_response["status"]
  end

  test "find all responds to json" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :find_all, format: :json, id: Invoice.first.id
    assert_response :success
  end

  test "find all returns all corresponding records" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :find_all, format: :json, status: Invoice.first.status
    assert_equal 2, json_response.count
  end

end
