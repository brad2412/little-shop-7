require "csv"

namespace :csv_load do
desc "customers"
  task customers: :environment do
    csv_text = File.read(Rails.root.join("db", "data", "customers.csv"))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      t = Customer.new
      t.id = row["id"]
      t.first_name = row["first_name"]
      t.last_name = row["last_name"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "customers loaded"
    ActiveRecord::Base.connection.reset_pk_sequence!('customers')
  end

  task invoice_items: :environment do
  desc "invoice items"
    csv_text = File.read(Rails.root.join("db", "data", "invoice_items.csv"))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      t = InvoiceItem.new
      t.id = row["id"]
      t.item_id = row["item_id"]
      t.invoice_id = row["invoice_id"] 
      t.quantity = row["quantity"] 
      t.unit_price = row["unit_price"] 
      t.status = row["status"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "invoice_items csv loaded"
    ActiveRecord::Base.connection.reset_pk_sequence!('invoice_items')
  end
  

  task invoices: :environment do 
  desc 'invoices'
    csv_text = File.read(Rails.root.join('db', 'data', 'invoices.csv'))
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      t = Invoice.new
      t.id = row["id"]
      t.customer_id = row['customer_id']
      t.status = row['status']
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts 'invoices loaded'
    ActiveRecord::Base.connection.reset_pk_sequence!('invoices')
  end
  
  task items: :environment do
  desc "items"
    csv_text = File.read(Rails.root.join('db', 'data', 'items.csv'))
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      t = Item.new
      t.id = row["id"]
      t.name = row["name"]
      t.description = row["description"]
      t.unit_price = row["unit_price"]
      t.merchant_id = row["merchant_id"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "Items loaded"
    ActiveRecord::Base.connection.reset_pk_sequence!('items')
  end
  
  task merchants: :environment do
  desc "merchants"
    csv_text = File.read(Rails.root.join('db', 'data', 'merchants.csv'))
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      t = Merchant.new
      t.id = row["id"]
      t.name = row["name"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "Merchants loaded"
    ActiveRecord::Base.connection.reset_pk_sequence!('merchants')
  end
  
  task transactions: :environment do
  desc "transactions"
    csv_text = File.read(Rails.root.join('db', 'data', 'transactions.csv'))
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      t = Transaction.new
      t.id = row["id"]
      t.invoice_id = row["invoice_id"]
      t.credit_card_number = row["credit_card_number"]
      t.credit_card_expiration_date = row["credit_card_expiration_date"]
      t.result = row["result"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
    end
    puts "Transactions loaded"
    ActiveRecord::Base.connection.reset_pk_sequence!('transactions')
  end

  task all: :environment do
  desc "all"
    Rake::Task["csv_load:customers"].invoke
    Rake::Task["csv_load:merchants"].invoke
    Rake::Task["csv_load:items"].invoke
    Rake::Task["csv_load:invoices"].invoke
    Rake::Task["csv_load:invoice_items"].invoke
    Rake::Task["csv_load:transactions"].invoke
    puts "all loaded"
  end
end
