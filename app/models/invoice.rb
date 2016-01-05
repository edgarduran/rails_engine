class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer

  # this scope makes sure your db is ordered in sequential order
  default_scope -> { order('id DESC') }
end
