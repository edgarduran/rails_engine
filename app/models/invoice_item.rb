class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  before_save :format_currency
  # this scope makes sure your db is ordered in sequential order
  # default_scope -> { order('id DESC') }

  private

  def format_currency
    self.unit_price = unit_price/100.00
  end
  
end
