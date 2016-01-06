require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index returns array of records" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test "index returns correct number records" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :index, format: :json
    assert_equal Transaction.count, json_response.count
  end

  test "index returns transactions with correct properties" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :index, format: :json
    json_response.each do |transaction|
      assert transaction["credit_card_number"]
      assert transaction["result"]
    end
  end

  test "show responds to json" do
    get :show, format: :json, id: 1
    assert_response :success
  end

  test "show returns correct record" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :show, format: :json, id: Transaction.last.id
    assert_equal Transaction.last.id, json_response["id"]
  end

  test "show returns transaction with correct properties" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :show, format: :json, id: Transaction.last.id
    assert_equal Transaction.last.credit_card_number, json_response["credit_card_number"]
    assert_equal Transaction.last.result, json_response["result"]
  end

  test "find responds to json" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :find, format: :json, id: Transaction.first.id
    assert_response :success
  end

  test "find returns correct record" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :find, format: :json, credit_card_number: Transaction.first.credit_card_number
    assert_equal Transaction.first.credit_card_number, json_response["credit_card_number"]
  end

  test "find all responds to json" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :find_all, format: :json, id: Transaction.first.id
    assert_response :success
  end

  test "find all returns all corresponding records" do
    transaction = create(:transaction)
    transaction2 = create(:transaction)
    get :find_all, format: :json, credit_card_number: Transaction.first.credit_card_number
    assert_equal 2, json_response.count
  end

end
