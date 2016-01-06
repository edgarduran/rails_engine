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


  # private
  #
  # def customer_params
  #   params.permit(:id, :name)
  # end
end
