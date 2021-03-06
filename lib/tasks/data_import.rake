require 'csv'

namespace :data do
  task :import => :environment do

    CSV.foreach("data/merchants.csv", :headers => true) do |column|
      Merchant.create(column.to_h)
      end

    CSV.foreach("data/customers.csv", :headers => true) do |column|
      Customer.create(column.to_h)
      end

    CSV.foreach("data/items.csv", :headers => true) do |column|
      Item.create(column.to_h)
      end

    CSV.foreach("data/invoices.csv", :headers => true) do |column|
      Invoice.create(column.to_h)
      end

    CSV.foreach("data/invoice_items.csv", :headers => true) do |column|
      InvoiceItem.create(column.to_h)
      end

    CSV.foreach("data/transactions.csv", :headers => true) do |column|
      Transaction.create ([
                           :credit_card_number => column['credit_card_number'],
                           :result => column['result'],
                           :invoice_id => column['invoice_id'],
                           :created_at => column['created_at'],
                           :updated_at => column['updated_at']]
                          )
      end
    end
  end
