namespace :csv_load do
  desc "cutomers"
  task customers: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("db", "data", "customers.csv"))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      t = Customer.new
      t.first_name = row["first_name"]
      t.last_name = row["last_name"]
      t.created_at = row["created_at"]
      t.updated_at = row["updated_at"]
      t.save
      puts "#{t.first_name} #{t.last_name} saved"
    end
    ActiveRecord::Base.connection.reset_pk_sequence!(‘customers’)
  end
  # task invoice_items: :environment do
  
  # end
  
  # task invoices: :environment do
  # end
  
  # task items: :environment do
  # end
  
  # task merchants: :environment do
  # end
  
  # task transactions: :environment do
  # end
end
