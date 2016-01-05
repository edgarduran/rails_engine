class AddCreditCardExpToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :credit_card_expiration_date, :date  
  end
end
