class Api::V1::MerchantsController < ApplicationController
  respond_to :json, :xml


  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def random
    respond_with Merchant.limit(1).order("RANDOM()")
  end

  def find
    if params["name"]
      respond_with Merchant.where("#{params.first.first} ILIKE ?", params.first.last).first
    else
      respond_with Merchant.where("#{params.first.first}": params.first.last).first
    end
  end

  def find_all
    if params["name"]
      respond_with Merchant.where("#{params.first.first} ILIKE ?", params.first.last)
    else
      respond_with Merchant.where("#{params.first.first}": params.first.last)
    end
  end

  def items
    respond_with Merchant.find_by(id: params[:id]).items
  end

  def invoices
    respond_with Merchant.find_by(id: params[:id]).invoices
  end

  def favorite_customer
    respond_with Merchant.find_by(id: params[:id]).favorite_customer(params)
  end

  def customers_with_pending_invoices
    respond_with Merchant.find_by(id: params[:id]).customers_with_pending_invoices(params)
  end

  def revenue
    if params[:date]
      respond_with ({ "revenue" => Merchant.find_by(id: params[:id]).revenue_on_date(params)})
    else
      respond_with ({ "revenue" => Merchant.find_by(id: params[:id]).revenue(params)})
    end
  end

  def most_items
    respond_with Merchant.all.most_items(params)
  end

  # private
  #
  # def customer_params
  #   params.permit(:id, :name)
  # end
end
