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
      Transaction.create(column.to_h)
      end

    end
  end
