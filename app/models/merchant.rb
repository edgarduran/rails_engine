class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  # this scope makes sure your db is ordered in sequential order
  # default_scope -> { order('id DESC') }

end
