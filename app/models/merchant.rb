class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  # this scope makes sure your db is ordered in sequential order
  # default_scope -> { order('id DESC') }

  def favorite_customer(params)
    invoices = Merchant.find_by(id: params[:id]).transactions.where(result: "success").pluck(:invoice_id)
    customers = Invoice.find(invoices).map { |invoice| invoice.customer_id }
    get_mode(customers)
  end

  def get_mode(customers)
    count = Hash.new(0)
    customers.each {|x| count[x] += 1 }
    id = count.sort_by{|k,v| v}.last[0]
    name = Customer.find_by(id: id)
  end

end
