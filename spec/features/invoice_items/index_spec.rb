require "rails_helper"

RSpec.describe "Index" do
  it "displays invoice items Index" do
     merchant = create(:merchant)
     item = create(:item, merchant: merchant)
      invoice_item = create(:invoice_item)
    # require 'pry'; binding.pry
    # puts invoice_item.item_id
    puts invoice_item.invoice_id
    puts invoice_item.quantity
    puts invoice_item.unit_price
    puts invoice_item.status
  end

  # it "displays invoice Index" do
  #   # merchant = create(:merchant)
  #   invoice = create(:invoice)
  #   # require 'pry'; binding.pry
  #   puts invoice.status
  # end

  # it "displays merchants" do
  #   # merchant = create(:merchant)
  #   merchant = create(:merchant)
  #   # require 'pry'; binding.pry
  #   puts merchant.name
  # end

  # it "displays merchants" do
  #   # merchant = create(:merchant)
  #   item = create(:item)
  #   # require 'pry'; binding.pry
  #   puts item.name
  # end
end

# create_list(:customer, 3)