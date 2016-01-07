class Api::V1::ItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def random
    respond_with Item.limit(1).order("RANDOM()")
  end

  def find
    if params["name"] || params["description"]
      respond_with Item.where("#{params.first.first} ILIKE ?", params.first.last).first
    else
      respond_with Item.where("#{params.first.first}": params.first.last).first
    end
  end

  def find_all
    if params["name"] || params["description"]
      respond_with Item.where("#{params.first.first} ILIKE ?", params.first.last)
    else
      respond_with Item.where("#{params.first.first}": params.first.last)
    end
  end

  def invoice_items
    respond_with Item.find_by(id: params[:id]).invoice_items
  end

  def merchant
    respond_with Item.find_by(id: params[:id]).merchant
  end

  def most_revenue
    respond_with Item.most_revenue(params[:quantity])
  end

  def most_items
    respond_with Item.find_by(id: params[:id])
  end

  def best_day
    respond_with Item.find_by(id: params[:id])
  end
end
