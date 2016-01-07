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

  def customers_with_pending_invoices(params)
    invoices = Merchant.find_by(id: params[:id]).transactions.where(result: "failed").pluck(:invoice_id)
    customers = Invoice.find(invoices).map { |invoice| invoice.customer }
  end

  def revenue(params)
    invoices = Merchant.find(params[:id]).invoices.pluck(:id)
    paid_invoices = Transaction.where(invoice_id: invoices).where(result: "success").pluck(:invoice_id)
    add_invoices(paid_invoices)
  end

  def revenue_on_date(params)
    invoices = Merchant.find(params[:id]).invoices.where(created_at: params["date"])
    invoices_ids = Merchant.find(params[:id]).invoices.where(created_at: params["date"]).pluck(:id)
    paid_invoices = Transaction.where(invoice_id: invoices_ids).where(result: "success").pluck(:invoice_id)
    add_invoices(paid_invoices)
  end

  def add_invoices(paid)
    InvoiceItem.where(invoice_id: paid).sum("unit_price * quantity")
  end

  def self.merchant_by_date(date)
    joins(invoices: [:transactions, :invoice_items]).where("transactions.result = ?", "success").where("invoices.created_at = ?", date).sum("invoice_items.quantity * invoice_items.unit_price")
  end


end
