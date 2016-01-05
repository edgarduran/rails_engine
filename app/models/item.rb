class Item < ActiveRecord::Base
  belongs_to :merchant

  # this scope makes sure your db is ordered in sequential order
  default_scope -> { order('id DESC') }
end
