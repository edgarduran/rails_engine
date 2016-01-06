class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items

  # has_many :items, through: :invoice_items

  # this scope makes sure your db is ordered in sequential order
  # default_scope -> { order('id DESC') }
end
