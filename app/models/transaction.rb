class Transaction < ActiveRecord::Base
  belongs_to :invoice


  # this scope makes sure your db is ordered in sequential order
  # default_scope -> { order('id DESC') }
end
