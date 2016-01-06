class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  # this scope makes sure your db is ordered in sequential order
  default_scope -> { order('id DESC') }

  def favorite_merchant
    # Customer.find_by(id: params[:id]).transactionswhere
  end
end
